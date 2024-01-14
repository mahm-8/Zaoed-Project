import 'package:zaoed/constants/imports.dart';

// ignore: must_be_immutable
class EditChargingPointScreen extends StatelessWidget {
  EditChargingPointScreen(
      {super.key, required this.bloc, required this.pointData});
  final ChargingPoint pointData;
  final ProviderBloc bloc;
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    controllerData();
    return Scaffold(
      backgroundColor: AppColors().gray9,
      appBar: addChargingScreenAppBar(context,
          title: 'تعديل نقطة شحن', isEditing: true, editFunc: () {
        editchargingscreenShowDialog(context, () {
       

          context.read<ProviderBloc>().add(EditChargingPointEvent(
              chargingPointName: controller.text,
              chargingCount: 0,
              pointID: pointData.pointId,
            

              arrivelHours: bloc.textClock[index1]));

          context.pop();
          context.pop();
        });
      }),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            children: [
              AddChargingPointTextField(
                textController: controller,
                isEdit: true,
              ),

             
              ChargingPointLocation(),
              AvailabilityHours(
             
                bloc: bloc,
                initialSelectedHour: pointData.arrivelHours!, isEdit: true,
              ),
            
              ChargingTypeSection(
                bloc: bloc,
                isEdit: true,
              ),
              const SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }

  controllerData() {
    controller.text = pointData.pointName ?? "";
  }
}

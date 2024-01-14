import 'package:zaoed/constants/imports.dart';

// ignore: must_be_immutable
class AddChargingPoint extends StatelessWidget {
  AddChargingPoint({super.key});
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ProviderBloc>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors().gray9,
      appBar: addChargingScreenAppBar(context,
          title: 'إضافة نقطة شحن', isEditing: false),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            children: [
              AddChargingPointTextField(
                textController: controller,
                isEdit: false,
              ),
              ChargingPointLocation(
                bloc: bloc,
              ),
              AvailabilityHours(
                bloc: bloc,
                initialSelectedHour: bloc.selectedHour,
                isEdit: false,
              ),
              ChargingTypeSection(
                bloc: bloc,
                isEdit: false,
              ),
              const SizedBox(
                height: 8,
              ),
              ButtonWidget(
                  textEntry: "إضافة",
                  backColor: AppColors().green,
                  onPress: () {
                    context.read<ProviderBloc>().add(AddChargingPointEvent(
                        
                        controller.text,
                        bloc.selectedHour,
                        bloc.pinLongitude,
                        bloc.pinLatitude));

                    addChargingPointShowDialog(context);
                    Future.delayed(const Duration(seconds: 2), () {
                      context.pop();
                    });
                  },
                  textColor: AppColors().gray8)
            ],
          ),
        ),
      ),
    );
  }
}

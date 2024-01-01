import 'package:zaoed/Screens/Provider/Profile/screens/AppBar/add_charging_app_bar.dart';
import 'package:zaoed/Screens/Provider/Profile/screens/ScreensWidgets/availability_hours.dart';
import 'package:zaoed/Screens/Provider/Profile/screens/ScreensWidgets/chargeing_type_section.dart';
import 'package:zaoed/Screens/Provider/Profile/screens/ScreensWidgets/charging_point_location.dart';
import 'package:zaoed/Screens/Provider/Profile/screens/ScreensWidgets/charging_point_text_field.dart';
import 'package:zaoed/Screens/Provider/Profile/screens/ScreensWidgets/edit_charging_dialog.dart';
import 'package:zaoed/blocs/providor_bloc/provider_bloc.dart';
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
          // edit on  hours
          // edit on  port counters

          context.read<ProviderBloc>().add(EditChargingPointEvent(
              chargingPointName: controller.text,
              chargingCount: 0,
              pointID: pointData.pointId,
              // problem is here  add the selected index

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

              // how to edit the old location
              ChargingPointLocation(),
              AvailabilityHours(
                // initialSelectedIndex
                bloc: bloc,
                initialSelectedHour: pointData.arrivelHours!, isEdit: true,
              ),
              // edit charging type get count from bloc
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

import 'package:zaoed/Screens/Finder/screens/Booking/scan_screen/scan_screen.dart';
import 'package:zaoed/blocs/actions_bloc/actions_bloc.dart';
import 'package:zaoed/components/sheet_method/car_charging_sheet.dart';
import 'package:zaoed/constants/imports.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SizedBox(
            height: 20,
          ),
          SearchFieldWidget(),
          const SizedBox(
            height: 16,
          ),
          ButtonChoiceWidget(
            imageUrl: "lib/assets/icons/map_layer.png",
            onPress: () {
              ratingBottomSheet(context, controller: controller);
            },
          ),
          const SizedBox(
            height: 10,
          ),
          ButtonChoiceWidget(
            imageUrl: "lib/assets/icons/main_info.png",
            onPress: () {
              context.chargingCarSheet();
            },
          ),
          const Spacer(),
          BlocBuilder<ActionsBloc, ActionsState>(
              buildWhen: (oldState, newState) {
            if (newState is GetChargingPointsState) {
              return true;
            }
            return false;
          }, builder: ((context, state) {
            if (state is GetChargingPointsState) {
              if (state.chargingPoints.isNotEmpty) {
                return SizedBox(
                  width: context.getWidth(divide: 1.1),
                  height: context.getHeight(divide: 2.9),
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: state.chargingPoints.length,
                      itemBuilder: (context, index) {
                        return ChargePointsCard(
                          chargingPoint: state.chargingPoints[index],
                          index: index,
                        );
                      }),
                );
              } else {
                return Center(
                  child: Text(
                    "لا توجد أي نقاط شحن حاليّا",
                    style: TextStyle(color: AppColors().gray4, fontSize: 19),
                  ),
                );
              }
            }
            return const SizedBox();
          })),
        ],
      ),
    );
  }
}

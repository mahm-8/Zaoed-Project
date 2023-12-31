import 'package:zaoed/blocs/actions_bloc/actions_bloc.dart';
import 'package:zaoed/blocs/bloc/raiting_bloc.dart';
import 'package:zaoed/components/sheet_method/car_charging_sheet.dart';
import 'package:zaoed/constants/imports.dart';


class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    context.read<ActionsBloc>().add(GetChargingPointsEvent());
    context.read<RaitingBloc>().add(GetRateEvent());

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
              ratingBottomSheet(context,controller: controller);

              // change map type
              // show trafic
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
          BlocBuilder<ActionsBloc, ActionsState>(builder: ((context, state) {
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
                        print(state.chargingPoints[index]);
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
            } else {
              if (state is LoadingState) {
                return Center(
                    child: CircularProgressIndicator(
                  color: AppColors().green,
                  strokeAlign: CircularProgressIndicator.strokeAlignCenter,
                  strokeWidth: 6,
                  strokeCap: StrokeCap.round,
                ));
              }
            }
            return const Text("error");
          })),
        ],
      ),
    );
  }
}

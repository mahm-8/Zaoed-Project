import 'package:flutter/material.dart';
import 'package:zaoed/Screens/Finder/screens/home/component/button_choice_widget.dart';
import 'package:zaoed/Screens/Finder/screens/home/component/charge_points_card.dart';
import 'package:zaoed/blocs/actions_bloc/actions_bloc.dart';
import 'package:zaoed/components/sheet_method/car_charging_sheet.dart';
import 'package:zaoed/constants/imports.dart';

import 'component/search_field.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    context.read<ActionsBloc>().add(GetChargingPointsEvent());

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
                  child: ListView.separated(
                    // seperated width
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: state.chargingPoints.length,
                    itemBuilder: (context, index) {
                      final chargingPoints = state.chargingPoints[index];

                      return ChargePointsCard(
                        pointID: chargingPoints.pointId,
                        pointName: chargingPoints.pointName,
                        chargingPort: chargingPoints.chargingPort,
                        rating: chargingPoints.rating,
                        langitude: chargingPoints.longitude,
                        latitude: chargingPoints.latitude,
                        chargingTimes: chargingPoints.chargingTimes,
                        portCount: chargingPoints.portCount,
                        index: index,
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        width: 15,
                      );
                    },
                  ),
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zaoed/Screens/Provider/Profile/screens/AppBar/profail_screens_app_bar.dart';
import 'package:zaoed/Screens/Provider/Profile/screens/ScreensWidgets/location_details.dart';
import 'package:zaoed/Screens/Provider/Profile/screens/add_charging_point.dart';
import 'package:zaoed/blocs/actions_bloc/actions_bloc.dart';
import 'package:zaoed/blocs/providor_bloc/provider_bloc.dart';
import 'package:zaoed/components/button_widget.dart';
import 'package:zaoed/constants/colors.dart';
import 'package:zaoed/extensions/navigator.dart';
import 'package:zaoed/extensions/screen_dimensions.dart';

class ChargingPointDataScreen extends StatelessWidget {
  const ChargingPointDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ActionsBloc>();
    context.read<ProviderBloc>();

    return Scaffold(
      backgroundColor: AppColors().gray9,
      appBar: profileScreenAppBar(context, title: 'بيانات نقطة الشحن'),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 16, left: 22.5, right: 18.5, bottom: 27),
        child: Column(
          children: [
            BlocBuilder<ProviderBloc, ProviderState>(
                // buildWhen: (previous, current) {
                //   if (state is ol) {

                //   }
                // },
                builder: ((context, state) {
              if (state is GetProviderChargingPointsState) {
                if (state.providerChargingPoints.isNotEmpty) {
                  return SizedBox(
                    width: context.getWidth(divide: 1.1),
                    height: context.getHeight(divide: 2.9),
                    child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: state.providerChargingPoints.length,
                      itemBuilder: (BuildContext conntext, int index) {
                        final providerChargingPoints =
                            state.providerChargingPoints[index];
                        return LocationDetails(
                          locationName: providerChargingPoints.pointName,
                          locationDetails:
                              "longtude: ${providerChargingPoints.longitude}\n, latitude: ${providerChargingPoints.latitude}",
                          index: index,
                          bloc: bloc,
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 15,
                        );
                      },
                    ),
                  );
                } else {
                  return Center(
                    child: Text(
                      "لا توجد لديك نقاط شحن لتعديلها",
                      style: TextStyle(color: AppColors().gray4, fontSize: 19),
                    ),
                  );
                }
              } else {
                if (state is ProviderLoadingState) {
                  return Center(
                      child: CircularProgressIndicator(
                    color: AppColors().green,
                    strokeAlign: CircularProgressIndicator.strokeAlignCenter,
                    strokeWidth: 6,
                    strokeCap: StrokeCap.round,
                  ));
                }
              }
              return const SizedBox();
            })),
            const Spacer(),
            ButtonWidget(
              textEntry: "إضافة نقطة شحن",
              backColor: AppColors().green,
              textColor: AppColors().white,
              onPress: () {
                context.push(view: AddChargingPoint());
              },
            )
          ],
        ),
      ),
    );
  }
}


/**
 *
  
 */
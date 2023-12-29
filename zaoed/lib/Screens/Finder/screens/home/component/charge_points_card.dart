import 'package:zaoed/blocs/actions_bloc/actions_bloc.dart';

import 'package:zaoed/Screens/Finder/screens/Booking/booking_screen.dart';

import 'package:zaoed/constants/imports.dart';

class ChargePointsCard extends StatelessWidget {
  const ChargePointsCard({
    super.key,
    required this.pointName,
    required this.chargingPort,
    required this.rating,
    required this.langitude,
    required this.latitude,
    required this.chargingTimes,
    required this.portCount,
    required this.pointID,
    required this.index,
  });

  final String? pointName, chargingPort;
  final double? rating, langitude, latitude;
  final int? chargingTimes, portCount, pointID;
  final int index;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ActionsBloc>();
    final id = bloc.bookmarkData?[index].bookmarkId;

    return Padding(
      padding: const EdgeInsets.only(bottom: 62.0),
      child: Container(
        height: 206,
        width: context.getWidth(),
        decoration: BoxDecoration(
          color: AppColors().gray1Trans,
          borderRadius: BorderRadius.circular(16),
          border: Border(
              left: BorderSide(color: AppColors().green, width: 0.4),
              top: BorderSide(color: AppColors().green, width: 0.4)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "$pointName",
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      color: AppColors().mainWhite,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Image.asset("lib/assets/icons/Star.png"),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    "$rating",
                    style: TextStyle(
                      color: AppColors().mainWhite,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    "($chargingTimes)",
                    style: TextStyle(
                      color: AppColors().gray4,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  if (isBookmarked == false)
                    AddToBookmarkDialog(
                      idPoint: pointID,
                    ),
                  if (isBookmarked == true)
                    RemoveBookMarkDialog(
                      bookmarkID: id,
                    ),
                ],
              ),
              Text(
                // get location name from lati, long
                //chargingPoint.pointLocation
                "$langitude, $latitude",
                overflow: TextOverflow.clip,

                style: TextStyle(
                  color: AppColors().gray4,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ChargersRowWidget(
                portCount: portCount,
                chargingPort: chargingPort,
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TrackonGoogleButtonWidget(
                    onPress: () {},
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  BookChargeButton(
                    onPress: () {
                      context.push(view: BookingScreen());
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ).asGlass(clipBorderRadius: BorderRadius.circular(16)),
    );
  }
}

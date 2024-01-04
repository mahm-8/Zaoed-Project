import 'package:geocoding/geocoding.dart';
import 'package:zaoed/constants/imports.dart';

class ChargePointsCard extends StatelessWidget {
  const ChargePointsCard({
    super.key,
    required this.index,
    required this.chargingPoint,
  });

  final ChargingPoint chargingPoint;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 62.0, left: 8, right: 8),
      child: Container(
        height: 206,
        width: context.getWidth(divide: 1.2),
        decoration: BoxDecoration(
          color: AppColors().gray1Trans,
          borderRadius: BorderRadius.circular(16),
          border: Border(
              left: BorderSide(color: AppColors().green, width: 0.3),
              top: BorderSide(color: AppColors().green, width: 0.3)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(chargingPoint.pointName ?? "",
                      overflow: TextOverflow.clip,
                      style: const TextStyle().buttonstyle2),
                  const SizedBox(
                    width: 8,
                  ),
                  Image.asset("lib/assets/icons/Star.png"),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    "${chargingPoint.rating ?? ""}",
                    style: const TextStyle().style22,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    "(${chargingPoint.chargingTimes})",
                    style: const TextStyle().style21,
                  ),
                  const Spacer(),
                  if (chargingPoint.booked == false)
                    AddToBookmarkDialog(
                      idPoint: chargingPoint.pointId,
                    ),
                ],
              ),
              FutureBuilder(
                future: const BookingLocationInformation().convertToCity(
                    chargingPoint.latitude, chargingPoint.longitude),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator(
                      color: AppColors().green,
                    );
                  } else if (snapshot.hasError || snapshot.data == null) {
                    return const Text("");
                  } else {
                    Placemark placemark = snapshot.data!.last;
                    return Text(
                      "${placemark.locality} ${placemark.subLocality}",
                      overflow: TextOverflow.clip,
                      style: const TextStyle().style21,
                    );
                  }
                },
              ),
              const SizedBox(
                height: 30,
              ),
              ChargersRowWidget(
                portCount: chargingPoint.portCount,
                chargingPort: chargingPoint.chargingPort,
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TrackonGoogleButtonWidget(
                    onPress: () {
                      context
                          .read<BottomSheetStatusBloc>()
                          .add(UpdateStatusEvent(status: Status.rating));
                    },
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  BookChargeButton(
                    onPress: () {
                      context.push(
                          view: BookingScreen(
                        bookMark: chargingPoint,
                      ));
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

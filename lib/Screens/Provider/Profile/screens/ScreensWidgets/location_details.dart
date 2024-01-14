import 'package:geocoding/geocoding.dart';
import 'package:zaoed/blocs/actions_bloc/actions_bloc.dart';
import 'package:zaoed/constants/imports.dart';

class LocationDetails extends StatelessWidget {
  const LocationDetails({
    super.key,
    required this.bloc,
    required this.pointsData,
  });

  final ChargingPoint pointsData;
  final ActionsBloc? bloc;

  @override
  Widget build(BuildContext context) {
    final dataBloc = context.read<ProviderBloc>();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Container(
        width: context.getWidth(),
        height: 115,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors().gray6,
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 20, left: 22, right: 21, bottom: 23),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    pointsData.pointName ?? "",
                    style: const TextStyle().style3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  FutureBuilder(
                    future: const BookingLocationInformation().convertToCity(
                        pointsData.latitude, pointsData.longitude),
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
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
                          style: const TextStyle().style8,
                          overflow: TextOverflow.ellipsis,
                        );
                      }
                    },
                  ),
                ],
              ),
              const Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                      onTap: () {
                        context.push(
                            view: EditChargingPointScreen(
                          bloc: dataBloc,
                          pointData: pointsData,
                        ));
                      },
                      child: Image.asset('lib/assets/icons/edit.png')),
                  const Spacer(),
                  InkWell(
                      onTap: () {
                        DeleteChargingPoint(context, pointsData.pointId);
                      },
                      child: Image.asset('lib/assets/icons/delete.png'))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

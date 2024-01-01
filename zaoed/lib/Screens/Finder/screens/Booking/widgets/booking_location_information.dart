// ignore_for_file: must_be_immutable
import 'package:zaoed/blocs/actions_bloc/actions_bloc.dart';
import 'package:zaoed/constants/imports.dart';
import 'package:geocoding/geocoding.dart';

class BookingLocationInformation extends StatelessWidget {
  BookingLocationInformation({
    super.key,
    this.chargingPoint,
  });
  final ChargingPoint? chargingPoint;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ActionsBloc, ActionsState>(
      builder: (context, state) {
        return FutureBuilder<List<Placemark>?>(
          future:
              convertToCity(chargingPoint?.latitude, chargingPoint?.longitude),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError || snapshot.data == null) {
              return const Text("خطأ");
            } else {
              Placemark placemark = snapshot.data!.first;
              // DefaultLocale.of(context)!.locale = 'ar';

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "الموقع",
                    style: TextStyle(fontSize: 19, color: AppColors().white),
                  ),
                  Text(
                    "${placemark.locality}, ${placemark.subLocality}",
                    style: TextStyle(fontSize: 17, color: AppColors().white),
                  ),
                ],
              );
            }
          },
        );
      },
    );
  }

  Future<List<Placemark>?> convertToCity(
      double? latitude, double? longitude) async {
    try {
      List<Placemark>? placemarks =
          await placemarkFromCoordinates(latitude!, longitude!);

      return placemarks;
    } catch (error) {
      print(error);
      return null;
    }
  }
}

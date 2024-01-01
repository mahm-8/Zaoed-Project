// ignore_for_file: must_be_immutable
import 'package:zaoed/blocs/actions_bloc/actions_bloc.dart';
import 'package:zaoed/constants/imports.dart';
import 'package:geocoding/geocoding.dart';

class BookingLocationInformation extends StatelessWidget {
  BookingLocationInformation({
    super.key,
    this.bookmarks,
  });
  final ChargingPoint? bookmarks;
  Placemark? placemark;
  Future<void> convertToCity(double? latitude, double? longitude) async {
    try {
      List<Placemark>? placemarks =
          await placemarkFromCoordinates(latitude!, longitude!);
      if (placemarks.isNotEmpty) {
        Placemark placemark = placemarks.first;
        print('======================City${placemark.locality}');
        print('====================${placemark.subLocality}');
      }
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    convertToCity(bookmarks!.longitude, bookmarks!.latitude);
    return BlocBuilder<ActionsBloc, ActionsState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "الموقع",
              style: TextStyle(fontSize: 19, color: AppColors().white),
            ),
            Text(
              '${bookmarks?.pointName}',
              style: TextStyle(fontSize: 17, color: AppColors().white),
            ),
            Text(
              "${bookmarks?.longitude}, ${bookmarks?.latitude}",
              style: TextStyle(
                  color: AppColors().white,
                  fontSize: 12,
                  fontWeight: FontWeight.w200),
            ),
          ],
        );
      },
    );
  }
}

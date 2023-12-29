import 'package:zaoed/Screens/Provider/Profile/methods_show_dialog/delete_charging_point.dart';
import 'package:zaoed/Screens/Provider/Profile/screens/edit_charging_point_screen.dart';
import 'package:zaoed/blocs/actions_bloc/actions_bloc.dart';
import 'package:zaoed/blocs/providor_bloc/provider_bloc.dart';
import 'package:zaoed/constants/imports.dart';

class LocationDetails extends StatelessWidget {
  const LocationDetails({
    super.key,
    required this.locationName,
    required this.locationDetails,
    required this.index,
    required this.bloc,
  });
  final String? locationName;
  final String? locationDetails;
  final int index;
  final ActionsBloc? bloc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Container(
        width: 350,
        height: 99,
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
                    locationName ?? "",
                    style: TextStyle(color: AppColors().white, fontSize: 18),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Spacer(),
                  Text(
                    locationDetails ?? "",
                    style: TextStyle(color: AppColors().white),
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
              const Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                      onTap: () {
                        context.push(view: EditChargingPointScreen());
                      },
                      child: Image.asset('lib/assets/icons/edit.png')),
                  const Spacer(),
                  InkWell(
                      onTap: () {
                        context.read<ProviderBloc>().add(
                            DeleteChargingPointEvent(
                                pointId: bloc?.bookmarkData?[index].pointId));
                        DeleteChargingPoint(context, index);
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

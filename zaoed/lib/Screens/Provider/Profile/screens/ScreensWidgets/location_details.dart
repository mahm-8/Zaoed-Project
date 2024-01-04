import 'package:zaoed/Screens/Provider/Profile/methods_show_dialog/delete_charging_point.dart';
import 'package:zaoed/Screens/Provider/Profile/screens/edit_charging_point_screen.dart';
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
                    pointsData.pointName ?? "",
                    style: const TextStyle().style3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Spacer(),
                  Text(
                    "${pointsData.longitude}\n ${pointsData.latitude}",
                    style: const TextStyle().style39,
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

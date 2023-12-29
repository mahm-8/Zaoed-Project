import 'package:zaoed/blocs/actions_bloc/actions_bloc.dart';
import 'package:zaoed/constants/imports.dart';

class LocationDetails extends StatelessWidget {
  const LocationDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ActionsBloc>();
    return Column(
      children: [
        Container(
          height: 40,
          width: 350,
          decoration: BoxDecoration(
              color: AppColors().gray6, borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Text(
              '{bloc.bookmarkData?[0].chargingPoint.pointName}',
              style: TextStyle(color: AppColors().white, fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:zaoed/blocs/actions_bloc/actions_bloc.dart';
import 'package:zaoed/constants/imports.dart';

class ChargeSpeedContainer extends StatelessWidget {
  const ChargeSpeedContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ActionsBloc>();
    return Container(
      height: 240,
      width: context.getWidth(),
      decoration: BoxDecoration(
          color: AppColors().gray1Trans,
          borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: bloc.chargingSpeed.length,
          itemBuilder: (context, index) {
            return Row(
              children: [
                BlocBuilder<ActionsBloc, ActionsState>(
                  builder: (context, state) {
                    return Checkbox(
                        activeColor: AppColors().green,
                        checkColor: AppColors().mainWhite,
                        side: BorderSide(color: AppColors().mainWhite),
                        value: bloc.chargingSpeedFilters[index],
                        onChanged: (value) {
                          context
                              .read<ActionsBloc>()
                              .add(ChargingSpeedFilterEvent(index, value!));
                        });
                  },
                ),
                Text(
                  bloc.chargingSpeed[index],
                  style: const TextStyle().style22,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

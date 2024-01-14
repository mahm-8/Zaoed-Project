import 'package:zaoed/blocs/actions_bloc/actions_bloc.dart';
import 'package:zaoed/constants/imports.dart';

class ChargerFiltiringRow extends StatelessWidget {
  const ChargerFiltiringRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ActionsBloc>();
    return SizedBox(
      height: 80,
      child: BlocBuilder<ActionsBloc, ActionsState>(
        builder: (context, state) {
          if (state is ChargerFilterState) {
            return ListView.separated(
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    width: 8,
                  );
                },
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: bloc.chargerImageUrl.length,
                itemBuilder: ((context, index) {
                  return GestureDetector(
                    onTap: () {
                      bloc.add(FilterChargerSelectionEvent(index));
                    },
                    child: ChargersWidget(
                      imageAsset: bloc.chargerImageUrl[index],
                      name: bloc.chargerTypes[index],
                      isSelected: state.selected == index,
                    ),
                  );
                }));
          }
          return ListView.separated(
              separatorBuilder: (context, index) {
                return const SizedBox(
                  width: 8,
                );
              },
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: bloc.chargerImageUrl.length,
              itemBuilder: ((context, index) {
                return GestureDetector(
                  onTap: () {
                    bloc.add(FilterChargerSelectionEvent(index));
                  },
                  child: ChargersWidget(
                    imageAsset: bloc.chargerImageUrl[index],
                    name: bloc.chargerTypes[index],
                    isSelected: 0 == index,
                  ),
                );
              }));
        },
      ),
    );
  }
}

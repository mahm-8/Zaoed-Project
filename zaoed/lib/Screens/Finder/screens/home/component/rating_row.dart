import 'package:zaoed/blocs/actions_bloc/actions_bloc.dart';
import 'package:zaoed/constants/imports.dart';

class RatingRow extends StatelessWidget {
  const RatingRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ActionsBloc>();
    return Container(
      width: context.getWidth(),
      height: 115,
      decoration: BoxDecoration(
          color: AppColors().gray1Trans,
          borderRadius: BorderRadius.circular(8)),
      child: Center(
        child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: BlocBuilder<ActionsBloc, ActionsState>(
                  builder: (context, state) {
                    return RatingLevelWidget(
                      title: bloc.choices[index],
                      imagUrl: bloc.starimageUrl[index],
                      isChecked: bloc.starFilters[index],
                      onChecked: (value) {
                        context
                            .read<ActionsBloc>()
                            .add(StarFilterEvent(index, value!));
                      },
                    );
                  },
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                width: 15,
              );
            },
            itemCount: bloc.starimageUrl.length),
      ),
    );
  }
}

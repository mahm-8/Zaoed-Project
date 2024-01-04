import 'package:zaoed/blocs/actions_bloc/action_methods.dart';
import 'package:zaoed/constants/imports.dart';
import 'package:zaoed/extensions/text_style.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    ActionSupabaseMethods().port();
    final bloc = context.read<FinderBloc>();
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SizedBox(
            height: 20,
          ),
          SearchFieldWidget(),
          const SizedBox(
            height: 16,
          ),
          ButtonChoiceWidget(
            imageUrl: "lib/assets/icons/map_layer.png",
            onPress: () {
              if (bloc.point != null) {
                context.arrivedToCharging(chargingPoint: bloc.point);
              }
            },
          ),
          const SizedBox(
            height: 10,
          ),
          ButtonChoiceWidget(
            imageUrl: "lib/assets/icons/main_info.png",
            onPress: () {
              context.chargingCarSheet();
            },
          ),
<<<<<<< HEAD
          const Spacer(),
          BlocBuilder<ActionsBloc, ActionsState>(
              buildWhen: (oldState, newState) {
=======
          Spacer(),
          BlocBuilder<ActionsBloc, ActionsState>(buildWhen: (_, newState) {
>>>>>>> 67c72e5dced85de035492b5da477599d5729dd3c
            if (newState is GetChargingPointsState) {
              return true;
            }
            return false;
          }, builder: ((context, state) {
            if (state is GetChargingPointsState) {
              if (state.chargingPoints.isNotEmpty) {
                return SizedBox(
                  width: context.getWidth(divide: 1.1),
                  height: context.getHeight(divide: 2.9),
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: state.chargingPoints.length,
                      itemBuilder: (context, index) {
                        return ChargePointsCard(
                          chargingPoint: state.chargingPoints[index],
                          index: index,
                        );
                      }),
                );
              } else {
                return Center(
                  child: Text(
                    "لا توجد أي نقاط شحن حاليّا",
                    style: const TextStyle().style20,
                  ),
                );
              }
            }
            return const SizedBox();
          })),
        ],
      ),
    );
  }
}

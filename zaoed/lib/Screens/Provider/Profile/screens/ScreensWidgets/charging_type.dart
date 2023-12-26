import 'package:zaoed/constants/imports.dart';
import 'package:zaoed/Screens/Provider/Profile/screens/ScreensWidgets/count_widget.dart';
import 'package:zaoed/blocs/providor_bloc/provider_bloc.dart';

class ChargingType extends StatefulWidget {
  const ChargingType({
    super.key,
    required this.imageUrl,
    required this.count,
    required this.type,
  });
  final String imageUrl;
  final String count;
  final String type;

  @override
  State<ChargingType> createState() => _ChargingTypeState();
}

class _ChargingTypeState extends State<ChargingType> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProviderBloc, ProviderState>(builder: (context, state) {
      final bloc = context.read<ProviderBloc>();
      final count = state is ChargingTypeCountUpdated ? state.count : 0;
      final isClicked = state is ChargingTypeIndexSelectedEvent ? true : false;
      return InkWell(
        onTap: () {
          bloc.add(ChargingTypeIndexSelectedEvent(isClicked));
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
          child: Column(
            children: [
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: isClicked ? AppColors().green : AppColors().gray6,
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                  child: Column(
                    children: [
                      Image.asset(widget.imageUrl),
                      Text(
                        widget.type,
                        style:
                            TextStyle(color: AppColors().white, fontSize: 10),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Container(
                height: 24,
                width: 72,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors().gray6),
                ),
                child: CountWidget(bloc: bloc, count: count),
              ),
            ],
          ),
        ),
      );
    });
  }
}

import 'package:zaoed/blocs/providor_bloc/provider_bloc.dart';
import 'package:zaoed/constants/imports.dart';

class ChargingTypeSection extends StatelessWidget {
  const ChargingTypeSection({
    super.key,
    required this.isEdit,
  });

  final bool isEdit;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ProviderBloc>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'نوع وعدد منافذ الشحن',
          style: TextStyle(color: AppColors().white, fontSize: 20),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: BlocBuilder<ProviderBloc, ProviderState>(
            builder: (context, state) {
              return Wrap(
                alignment: WrapAlignment.center,
                children: [
                  ChargingType(
                    imageUrl: 'lib/assets/icons/GB.png',
                    // edit? edit on count: bloc.count;
                    count: isEdit ? 0 : bloc.count1,
                    type: 'GB/T AC',
                    decrement: () {
                      bloc.add(ChargingTypeIncrementCountEvent(name: "count1"));
                    },
                    increment: () {
                      bloc.add(ChargingTypeDecrementCountEvent(name: "count1"));
                    },
                  ),
                  ChargingType(
                    imageUrl: 'lib/assets/icons/Type 2.png',
                    count: bloc.count2,
                    type: 'Type2',
                    decrement: () {
                      bloc.add(ChargingTypeIncrementCountEvent(name: "count2"));
                    },
                    increment: () {
                      bloc.add(ChargingTypeDecrementCountEvent(name: "count2"));
                    },
                  ),
                  ChargingType(
                    imageUrl: 'lib/assets/icons/Tesla.png',
                    count: bloc.count3,
                    type: 'Tesla',
                    decrement: () {
                      bloc.add(ChargingTypeIncrementCountEvent(name: "count3"));
                    },
                    increment: () {
                      bloc.add(ChargingTypeDecrementCountEvent(name: "count3"));
                    },
                  ),
                  ChargingType(
                    imageUrl: 'lib/assets/icons/Type 1.png',
                    count: bloc.count4,
                    type: 'Type1',
                    decrement: () {
                      bloc.add(ChargingTypeIncrementCountEvent(name: "count4"));
                    },
                    increment: () {
                      bloc.add(ChargingTypeDecrementCountEvent(name: "count4"));
                    },
                  ),
                  ChargingType(
                    imageUrl: 'lib/assets/icons/CCS 1.png',
                    count: bloc.count5,
                    type: 'CCS 1',
                    decrement: () {
                      bloc.add(ChargingTypeIncrementCountEvent(name: "count5"));
                    },
                    increment: () {
                      bloc.add(ChargingTypeDecrementCountEvent(name: "count5"));
                    },
                  ),
                  ChargingType(
                    imageUrl: 'lib/assets/icons/CCS 2.png',
                    count: bloc.count6,
                    type: 'CCS 2',
                    decrement: () {
                      bloc.add(ChargingTypeIncrementCountEvent(name: "count6"));
                    },
                    increment: () {
                      bloc.add(ChargingTypeDecrementCountEvent(name: "count6"));
                    },
                  ),
                  ChargingType(
                    imageUrl: 'lib/assets/icons/Chademo.png',
                    count: bloc.count7,
                    type: 'Chademo',
                    decrement: () {
                      bloc.add(ChargingTypeIncrementCountEvent(name: "count7"));
                    },
                    increment: () {
                      bloc.add(ChargingTypeDecrementCountEvent(name: "count7"));
                    },
                  )
                ],
              );
            },
          ),
        )
      ],
    );
  }
}

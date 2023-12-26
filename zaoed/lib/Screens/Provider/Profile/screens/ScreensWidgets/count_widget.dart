
import 'package:flutter/material.dart';
import 'package:zaoed/blocs/providor_bloc/provider_bloc.dart';
import 'package:zaoed/constants/colors.dart';

class CountWidget extends StatelessWidget {
  const CountWidget({
    super.key,
    required this.bloc,
    required this.count,
  });

  final ProviderBloc bloc;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              bloc.add(ChargingTypeDecrementCountEvent());
            },
            child: Image.asset(
              'lib/assets/icons/ph_minus.png',
              color: AppColors().gray6,
              width: 30,
              height: 30,
            ),
          ),
          const Spacer(),
          Text(
            count.toString(),
            style:
                TextStyle(color: AppColors().white, fontSize: 12),
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              bloc.add(ChargingTypeIncrementCountEvent());
            },
            child: Image.asset(
              'lib/assets/icons/ph_plus.png',
              width: 27,
              height: 27,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:zaoed/blocs/providor_bloc/provider_bloc.dart';
import 'package:zaoed/constants/colors.dart';

class CountWidget extends StatelessWidget {
  const CountWidget({
    super.key,
    required this.count, this.increment, this.decrement,
  });

  final int count;
  final Function()? increment;
  final Function()? decrement;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1),
      child: Row(
        children: [
          InkWell(
            onTap: increment,
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
            style: TextStyle(color: AppColors().white, fontSize: 12),
          ),
          const Spacer(),
          InkWell(
            onTap: decrement,
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

// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zaoed/blocs/car_bloc/cars_bloc.dart';
import 'package:zaoed/blocs/user_bloc/user_bloc.dart';
import 'package:zaoed/blocs/user_bloc/user_event.dart';
import 'package:zaoed/constants/colors.dart';

class DropDownWidget extends StatefulWidget {
  DropDownWidget({
    super.key,
    this.brandController,
    required this.brand,
    required this.list,
  });

  final ExpansionTileController? brandController;
  String brand;
  final List<String> list;

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      collapsedIconColor: AppColors().white,
      controller: widget.brandController,
      collapsedTextColor: AppColors().white,
      collapsedBackgroundColor: AppColors().gray6,
      backgroundColor: AppColors().gray6,
      textColor: AppColors().white,
      collapsedShape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      title: Text(
        widget.brand,
      ),
      children: [
        ...widget.list.map((e) => ListTile(
              title: Text(
                e,
                style: TextStyle(
                  color: AppColors().white,
                ),
              ),
              onTap: () {
                context.read<UserBloc>().add(GenderEvent(gender: e));
                context.read<CarsBloc>().add(SelectCarDeteilsEvent(select: e));
                widget.brandController!.collapse();
              },
            ))
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:zaoed/constants/colors.dart';

class ChargingTime extends StatefulWidget {
  const ChargingTime({super.key, required this.hours});

  final List hours;

  @override
  State<ChargingTime> createState() => _ChargingTimeState();
}

class _ChargingTimeState extends State<ChargingTime> {
  late int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      width: 350,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Container(
              width: 88,
              height: 42,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  width: 2,
                  color: index == selectedIndex
                      ? AppColors().green
                      : AppColors().gray6,
                ),
              ),
              child: Center(
                child: Text(
                  widget.hours[index],
                  style: TextStyle(
                    color: index == selectedIndex
                        ? AppColors().green
                        : AppColors().white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: 8,
          );
        },
        itemCount: widget.hours.length,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:zaoed/constants/colors.dart';

class ChargingTypeContainer extends StatefulWidget {
  const ChargingTypeContainer({
    super.key,
    required this.imageUrl,
    required this.type,
  });
  final String imageUrl;
  final String type;

  @override
  State<ChargingTypeContainer> createState() => _ChargingTypeContainerState();
}

class _ChargingTypeContainerState extends State<ChargingTypeContainer> {
  late bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isClicked = true;
        });
      },
      child: Container(
        height: 76,
        width: 76,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
                color: isClicked ? AppColors().green : AppColors().gray6)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
          child: Column(
            children: [
              Image.asset(widget.imageUrl),
              Text(
                widget.type,
                style: TextStyle(color: AppColors().white, fontSize: 10),
              )
            ],
          ),
        ),
      ),
    );
  }
}

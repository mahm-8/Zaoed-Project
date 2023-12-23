import 'package:flutter/material.dart';
import 'package:zaoed/constants/colors.dart';

class ChargingType extends StatefulWidget {
  ChargingType({
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
  late bool isClicked = false;

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: () {
        setState(() {
          isClicked = true;
        });
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
                      color:
                          isClicked ? AppColors().green : AppColors().gray6)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
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
            const SizedBox(
              height: 4,
            ),
            Container(
              height: 24,
              width: 72,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors().gray6)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 1),
                child: Row(
                  children: [
                    Image.asset(
                      'lib/assets/icons/ph_minus.png',
                      color: AppColors().gray6,
                      width: 30,
                      height: 30,
                    ),
                    Spacer(),
                    Text(widget.count,
                        style:
                            TextStyle(color: AppColors().white, fontSize: 12)),
                    Spacer(),
                    Image.asset(
                      'lib/assets/icons/ph_plus.png',
                      width: 27,
                      height: 27,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

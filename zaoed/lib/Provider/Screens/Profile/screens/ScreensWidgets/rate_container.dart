import 'package:flutter/material.dart';
import 'package:zaoed/constants/colors.dart';

class RateContainer extends StatelessWidget {
  const RateContainer({
    super.key, required this.title, required this.subTitle,
  });
 final String title;
final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 304,
      width: 350,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 37),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
            Text(
              subTitle,
              style: TextStyle(color: AppColors().white, fontSize: 16),
            ),
            Divider(
              color: Colors.grey,
              thickness: 1,
            ),
          ],
        ),
      ),
    );
  }
}

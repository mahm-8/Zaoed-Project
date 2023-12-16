import 'package:flutter/material.dart';
import 'package:zaoed/constants/colors.dart';

class SocialMediaInformation extends StatelessWidget {
  const SocialMediaInformation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('lib/assets/icons/devicon_twitter.png'),
            SizedBox(
              width: 14,
            ),
            Image.asset('lib/assets/icons/lucide_instagram.png'),
          ],
        ),
        SizedBox(
          height: 9.5,
        ),
        Text(
          'الإصدارv1.000',
          style: TextStyle(
            color: AppColors().white,
          ),
        ),
      ],
    );
  }
}

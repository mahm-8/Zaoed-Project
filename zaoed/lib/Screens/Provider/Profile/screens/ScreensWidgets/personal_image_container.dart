import 'package:flutter/material.dart';
import 'package:zaoed/constants/colors.dart';

class PersonalImageContainer extends StatelessWidget {
  const PersonalImageContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 125, vertical: 16),
      child: Stack(
        children: [
          ClipOval(
              child: Container(
                  width: 100,
                  height: 100,
                  color: AppColors().gray6,
                  child: ImageIcon(
                    const AssetImage('lib/assets/icons/person_prof.png'),
                    color: AppColors().white,
                  ))),
          Positioned(
            top: 71,
            left: 0,
            child: InkWell(
              onTap: () {},
              child: ClipOval(
                child: Container(
                    width: 20,
                    height: 20,
                    color: AppColors().gray9,
                    child: Image.asset('lib/assets/icons/plus_w.png')),
              ),
            ),
          )
        ],
      ),
    );
  }
}

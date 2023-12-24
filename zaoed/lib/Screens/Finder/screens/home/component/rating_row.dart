
import 'package:zaoed/constants/imports.dart';

class RatingRow extends StatelessWidget {
  const RatingRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 86,
      decoration: BoxDecoration(
          color: AppColors().gray1Trans,
          borderRadius: BorderRadius.circular(8)),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RatingLevelWidget(
                title: "كل الخيارات",
                imagUrl: "lib/assets/icons/all_rating.png"),
            RatingLevelWidget(
                title: "نجمة فأقل ", imagUrl: "lib/assets/icons/one_star.png"),
            RatingLevelWidget(
                title: "نجمتين فأقل", imagUrl: "lib/assets/icons/two_star.png"),
            RatingLevelWidget(
                title: "ثلاثة فأقل",
                imagUrl: "lib/assets/icons/three_star.png"),
            RatingLevelWidget(
                title: "أربعة فأقل", imagUrl: "lib/assets/icons/four_star.png"),
            RatingLevelWidget(
                title: "خمسة نجوم", imagUrl: "lib/assets/icons/five_star.png"),
          ],
        ),
      ),
    );
  }
}

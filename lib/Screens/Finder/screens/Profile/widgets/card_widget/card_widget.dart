import 'package:zaoed/constants/imports.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.getHeight(divide: 3.9),
      width: context.getWidth(divide: 1.1),
      child: Stack(
        children: [
          Positioned(
            top: 10,
            left: 10,
            right: 10,
            child: Container(
              width: context.getWidth(divide: 1.2),
              height: context.getHeight(divide: 4.1),
              decoration: BoxDecoration(
                  gradient: AppColors().pageRadiant,
                  borderRadius: BorderRadius.circular(15)),
            ),
          ),
          Positioned(
              top: 23,
              right: 20,
              child: Image.asset("lib/assets/icons/atheer.png")),
          Positioned(
              top: 25,
              right: 45,
              child: Image.asset("lib/assets/icons/cridt.png")),
          Positioned(
              top: 30,
              left: 20,
              child: Image.asset("lib/assets/icons/mastercard.png")),
          Positioned(
              top: 110,
              left: 30,
              child: Image.asset("lib/assets/icons/.....png")),
          Positioned(
              top: 140,
              left: 30,
              child: Text(
                "Card Holder",
                style: TextStyle(color: AppColors().white),
              )),
          Positioned(
              top: 140,
              right: 30,
              child: Text("Card Holder",
                  style: TextStyle(color: AppColors().white))),
          Positioned(
              top: 160,
              left: 30,
              child: Text("**** **** **** ****",
                  style: TextStyle(color: AppColors().white))),
          Positioned(
              top: 160,
              right: 30,
              child:
                  Text("********", style: TextStyle(color: AppColors().white))),
        ],
      ),
    );
  }
}

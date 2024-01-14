import 'package:zaoed/constants/imports.dart';

class AppColors {
  Color black = const Color(0xff1E2024);
  Color white = const Color(0xffF4F4F4);
  Color mainWhite = const Color(0xFFFFFFFF);
  Color gray = const Color(0xffA3A3A3);
  Color gray1 = const Color(0xff535868);
  Color gray2 = const Color(0xff535868);
  Color gray1Trans = const Color(0xff535868).withOpacity(0.4);
  Color gray3 = const Color(0xffD9D9D9);
  Color gray4 = const Color(0xffA9AEB1);
  Color gray5 = const Color(0xff505364);
  Color gray6 = const Color(0xff353843);
  Color gray7 = const Color(0xff303337);
  Color gray8 = const Color(0xff272A33);
  Color gray9 = const Color(0xff21232B);
  Color red = const Color(0xffFF453A);
  Color green = const Color(0xff3FEDB2);
  Color shadowGreen = const Color(0xff3FEDB2).withOpacity(0.15);
  Color blueColor = Colors.blue[700]!;
  Color blue = Colors.blue;
  Gradient greenRadiant1 = const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Color(0xff3FEDB2), Color(0xff5C5F6C)]);
  Gradient greenRadiant2 = const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Color(0xff3FEDB2), Color(0xff5C5F6C)]); 
  Gradient pageRadiant = const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Color(0xff3FEDB2), Color(0xff535868)]);
}

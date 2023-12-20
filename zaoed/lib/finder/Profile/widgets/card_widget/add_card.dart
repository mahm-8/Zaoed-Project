import 'package:flutter/material.dart';
import 'package:zaoed/constants/colors.dart';
import 'package:zaoed/extensions/screen_dimensions.dart';
import 'package:zaoed/finder/Profile/screens/AppBar/profail_screens_app_bar.dart';

class AddCard extends StatelessWidget {
  const AddCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().gray9,
      appBar: appBar(context, title: 'إضافة بطاقة'),
      body: SafeArea(
          child: ListView(
        children: [
          SizedBox(
            height: context.getHeight(divide: 4),
            width: context.getWidth(divide: 1.1),
            child: Stack(
              children: [
                Positioned(
                  top: 10,
                  left: 10,
                  right: 10,
                  child: Container(
                    width: context.getWidth(divide: 1.2),
                    height: context.getHeight(divide: 4),
                    decoration:
                        BoxDecoration(gradient: AppColors().pageRadiant),
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
                    top: 25,
                    left: 20,
                    child: Image.asset("lib/assets/icons/mastercard.png")),
                Positioned(
                    top: 110,
                    left: 30,
                    child: Image.asset("lib/assets/icons/.....png")),
                Positioned(top: 130, left: 30, child: Text("Card Holder")),
                Positioned(top: 130, right: 30, child: Text("Card Holder")),
              ],
            ),
          )
        ],
      )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:zaoed/constants/colors.dart';
import 'package:zaoed/extensions/navigator.dart';
import 'package:zaoed/extensions/screen_dimensions.dart';
import 'package:zaoed/finder/Profile/screens/AppBar/profail_screens_app_bar.dart';
import 'package:zaoed/finder/Profile/screens/ScreensWidgets/add_car.dart';

class CarScreen extends StatelessWidget {
  const CarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, title: 'بيانات المركبات'),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          context.push(view: AddCar());
        },
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            foregroundColor: AppColors().gray8,
            minimumSize: Size(context.getWidth(divide: 1.1), 40),
            backgroundColor: AppColors().green),
        child: const Text(
          "إضافة",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: AppColors().gray9,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              height: context.getHeight(divide: 8),
              width: context.getWidth(divide: 1.2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors().gray6),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "تيسلا",
                        style:
                            TextStyle(color: AppColors().white, fontSize: 16),
                      ),
                      TextButton(
                          style: TextButton.styleFrom(
                              enableFeedback: true,
                              foregroundColor: AppColors().green),
                          onPressed: () {},
                          child: const Text(
                            "بيانات السيارة",
                            
                          ))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("موديل 3 (Model 3)",
                          style: TextStyle(
                              color: AppColors().white, fontSize: 14)),
                      SizedBox(
                        height: 30,
                        child: VerticalDivider(
                          color: AppColors().black,
                        ),
                      ),
                      Text("منفذ (CCS 2)",
                          style:
                              TextStyle(color: AppColors().white, fontSize: 14))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      )
          //     Center(
          //         child: Text(
          //   "لاتوجد أي مركبة مضافة حالياٍ",
          //   style: TextStyle(color: AppColors().white),
          // ))
          ),
    );
  }
}

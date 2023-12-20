import 'package:flutter/material.dart';
import 'package:zaoed/constants/colors.dart';
import 'package:zaoed/extensions/navigator.dart';
import 'package:zaoed/extensions/screen_dimensions.dart';
import 'package:zaoed/finder/Profile/screens/AppBar/profail_screens_app_bar.dart';
import 'package:zaoed/finder/Profile/widgets/card_widget/add_card.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, title: 'البطاقات'),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          context.push(view: AddCard());
        },
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            foregroundColor: AppColors().gray8,
            minimumSize: Size(context.getWidth(divide: 1.1), 40),
            backgroundColor: AppColors().green),
        child: const Text("إضافة بطاقة"),
      ),
      backgroundColor: AppColors().gray9,
      body: SafeArea(
          child: Center(
              child: Text(
        "لاتوجد أي بطاقة مضافة حالياٍ",
        style: TextStyle(color: AppColors().white),
      ))),
    );
  }
}

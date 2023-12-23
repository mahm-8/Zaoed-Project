import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:zaoed/constants/colors.dart';

class SearchFieldWidget extends StatelessWidget {
  SearchFieldWidget({super.key});

  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      blur: 4,
      height: 48,
      color: AppColors().gray1Trans,
      borderRadius: BorderRadius.circular(30),
      border: Border(
          left: BorderSide(color: AppColors().green, width: 0.4),
          top: BorderSide(color: AppColors().green, width: 0.4)),
      child: TextField(
        maxLines: 1,
        cursorColor: AppColors().green,
        keyboardType: TextInputType.text,
        controller: searchController,
        style: TextStyle(
          fontSize: 17,
          color: AppColors().white,
        ),
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          fillColor: AppColors().gray1Trans,
          filled: true,
          suffixIcon: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Image.asset(
              'lib/assets/icons/filter.png',
            ),
          ),
          hintText: "بحث",
          hintStyle: TextStyle(color: AppColors().gray4, fontSize: 17),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(30)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(30)),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:zaoed/constants/colors.dart';

class EditProfile extends StatelessWidget {
  const EditProfile(
      {super.key,
      required this.title,
      this.value,
      this.icon = Icons.edit_outlined, this.onPressed });
  final String title;
  final String? value;
  final IconData? icon;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      child: ListTile(
        leading: Text(
          title,
          style: TextStyle(
              color: AppColors().white,
              fontSize: 16,
              fontWeight: FontWeight.bold),
        ),
        title: Text(
          value ?? "",
          style: TextStyle(color: AppColors().white),
        ),
        trailing: IconButton(icon: Icon(
          icon,
          color: AppColors().white,
          size: 20,
        ),
        onPressed:onPressed ),
      ),
    );
  }
}

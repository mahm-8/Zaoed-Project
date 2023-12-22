import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class TextfieldWidget extends StatelessWidget {
  const TextfieldWidget(
      {super.key,
      required this.keyboardType,
      required this.hint,
      required this.obscure,
      this.controller,
      this.keyForm,
      this.validator,
      required this.displayPass,
      this.onTap});

  final TextInputType keyboardType;
  final String hint;
  final bool obscure;
  final TextEditingController? controller;
  final GlobalKey? keyForm;
  final String? Function(String?)? validator;
  final bool displayPass;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SizedBox(
        height: 50,
        width: MediaQuery.of(context).size.width,
        child: Form(
          key: keyForm,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border(
                  left: BorderSide(color: AppColors().green, width: 0.4),
                  top: BorderSide(color: AppColors().green, width: 0.4)),
            ),
            child: TextFormField(
              maxLines: 1,
              cursorColor: AppColors().green,
              keyboardType: keyboardType,
              validator: validator,
              obscureText: !obscure ? false : !displayPass,
              controller: controller,
              style: TextStyle(
                fontSize: 17,
                color: AppColors().white,
              ),
              decoration: InputDecoration(
                fillColor: AppColors().gray1Trans,
                filled: true,
                suffixIcon: !obscure
                    ? null
                    : InkWell(
                        onTap: onTap,
                        child: Icon(
                          !displayPass
                              ? Icons.visibility_off_sharp
                              : Icons.remove_red_eye,
                        ),
                      ),
                hintText: hint,
                hintStyle: TextStyle(color: AppColors().gray4, fontSize: 17),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(8)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(8)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(8)),
                errorBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

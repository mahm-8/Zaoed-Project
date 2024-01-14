import 'package:flutter/cupertino.dart';
import 'package:zaoed/constants/imports.dart';

showDatePickerWidget(
    {required BuildContext context,
    Function(String)? onDateTimeChanged}) async {
  return await showCupertinoModalPopup<void>(
    context: context,
    builder: (_) {
      final size = context.getHeight(divide: 3);
      return Container(
        decoration: BoxDecoration(
          color: AppColors().gray8,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
        ),
        height: size,
        child: Column(
          children: [
            Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: () {
                      context.pop();
                    },
                    child: Text(
                      "إختيار",
                      style: const TextStyle().style2,
                    ))),
            SizedBox(
              height: 200,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                onDateTimeChanged: (value) {
                  if (onDateTimeChanged != null) {
                    onDateTimeChanged(
                        "${value.year}/${value.day}/${value.month}");
                  }
                },
              ),
            ),
          ],
        ),
      );
    },
  );
}

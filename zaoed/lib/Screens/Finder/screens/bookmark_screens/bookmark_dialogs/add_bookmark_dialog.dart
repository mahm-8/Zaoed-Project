import 'package:flutter/material.dart';
import 'package:zaoed/components/dialog_widgets/dialog_widget.dart';
import 'package:zaoed/providor_show_dialogs/components/state_dialog.dart';

class AddToBookmarkDialog extends StatefulWidget {
  const AddToBookmarkDialog({super.key});

  @override
  State<AddToBookmarkDialog> createState() => _AddToBookmarkDialogState();
}

bool isBookmarked = false;

class _AddToBookmarkDialogState extends State<AddToBookmarkDialog> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // add to bookmark list
        //show dialog added
        showDialog(
          barrierColor: Colors.transparent,
          context: context,
          builder: (context) {
            return DialogWidget(
              title: "إضافة إلى المحفوظات",
              bodyText: "سيتم إضافة نقطة الشحن إلى المحفوظات هل أنت موافق؟",
              button1: 'موافق',
              pressOne: () {
                Navigator.of(context).pop();
                showDialog(
                  barrierColor: Colors.transparent,
                  context: context,
                  builder: (context) {
                    return const StateDialog(
                      title: "تمت عملية الإضافة بنجاح",
                    );
                  },
                );
                Future.delayed(const Duration(seconds: 3), () {
                  Navigator.of(context).pop();
                });
                setState(() {
                  isBookmarked = true;
                });
              },
              button2: 'إلغاء',
              pressTwo: () {
                Navigator.of(context).pop();
              },
            );
          },
        );
      },
      child: Image.asset("lib/assets/icons/not_bookmarked.png"),
    );
  }
}

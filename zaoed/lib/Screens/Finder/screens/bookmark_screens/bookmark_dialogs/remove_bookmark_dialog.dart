import 'package:flutter/material.dart';
import 'package:zaoed/components/dialog_widgets/dialog_widget.dart';
import 'package:zaoed/providor_show_dialogs/components/state_dialog.dart';

import 'add_bookmark_dialog.dart';

class RemoveBookMarkDialog extends StatefulWidget {
  const RemoveBookMarkDialog({super.key});

  @override
  State<RemoveBookMarkDialog> createState() => _RemoveBookMarkDialogState();
}

class _RemoveBookMarkDialogState extends State<RemoveBookMarkDialog> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // remove from the bookmark list
        // show dialog removed
        showDialog(
          barrierColor: Colors.transparent,
          context: context,
          builder: (context) {
            return DialogWidget(
              title: "تنبية!",
              bodyText: "سيتم إزالة نقطة الشحن من المحفوظات، هل أنت موافق؟",
              button1: 'موافق',
              pressOne: () {
                Navigator.of(context).pop();

                showDialog(
                  barrierColor: Colors.transparent,
                  context: context,
                  builder: (context) {
                    return const StateDialog(
                      title: "تمت عملية الحذف بنجاح",
                    );
                  },
                );
                Future.delayed(const Duration(seconds: 3), () {
                  Navigator.of(context).pop(); // Dismiss the dialog
                });

                setState(() {
                  isBookmarked = false;
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
      child: Image.asset("lib/assets/icons/bookmarked.png"),
    );
  }
}
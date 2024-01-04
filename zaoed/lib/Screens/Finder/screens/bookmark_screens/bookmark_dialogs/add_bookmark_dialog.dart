import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zaoed/blocs/actions_bloc/actions_bloc.dart';
import 'package:zaoed/components/dialog_widgets/dialog_widget.dart';
import 'package:zaoed/constants/imports.dart';
import 'package:zaoed/providor_show_dialogs/components/state_dialog.dart';

class AddToBookmarkDialog extends StatelessWidget {
  const AddToBookmarkDialog({super.key, required this.idPoint});

  final int? idPoint;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          barrierColor: Colors.transparent,
          context: context,
          builder: (context) {
            return DialogWidget(
              title: "إضافة إلى المحفوظات",
              bodyText: "سيتم إضافة نقطة الشحن إلى المحفوظات هل أنت موافق؟",
              button1: 'موافق',
              pressOne: () async {
                context.read<ActionsBloc>().add(AddBookmarkEvent(
                      pointID: idPoint,
                    ));
                context.pop();
                showDialog(
                  barrierColor: Colors.transparent,
                  context: context,
                  builder: (context) {
                    return const StateDialog(
                      title: "تمت عملية الإضافة بنجاح",
                    );
                  },
                );
                // Future.delayed(const Duration(seconds: 3), () {
                //   context.pop();
                // });
              },
              button2: 'إلغاء',
              pressTwo: () {
                context.pop();
              },
            );
          },
        );
      },
      child: Image.asset("lib/assets/icons/not_bookmarked.png"),
    );
  }
}

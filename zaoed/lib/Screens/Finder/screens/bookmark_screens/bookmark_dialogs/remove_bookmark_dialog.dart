import 'package:zaoed/constants/imports.dart';

class RemoveBookMarkDialog extends StatefulWidget {
  const RemoveBookMarkDialog({super.key, this.bookmark});
  final BookmarkModel? bookmark;
  @override
  State<RemoveBookMarkDialog> createState() => _RemoveBookMarkDialogState();
}

class _RemoveBookMarkDialogState extends State<RemoveBookMarkDialog> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
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

                context
                    .read<UserBloc>()
                    .add(DeleteBookmarkEvent(id: widget.bookmark?.id));

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
                  context.pop(); // Dismiss the dialog
                });

                setState(() {
                  isBookmarked = false;
                });
              },
              button2: 'إلغاء',
              pressTwo: () {
                context.pop();
              },
            );
          },
        );
      },
      child: Image.asset("lib/assets/icons/bookmarked.png"),
    );
  }
}

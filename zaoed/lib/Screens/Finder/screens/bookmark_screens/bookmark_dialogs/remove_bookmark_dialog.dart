import 'package:zaoed/blocs/finder_bloc/bloc/finder_bloc.dart';
import 'package:zaoed/constants/imports.dart';

class RemoveBookMarkDialog extends StatefulWidget {
  const RemoveBookMarkDialog({super.key, required this.bookmarkId});
  final int? bookmarkId;
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
                    .read<FinderBloc>()
                    .add(DeleteBookmarkEvent(id: widget.bookmarkId));

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

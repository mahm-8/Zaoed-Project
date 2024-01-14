import 'package:zaoed/constants/imports.dart';
import 'package:zaoed/blocs/actions_bloc/actions_bloc.dart';

class RemoveBookMarkDialog extends StatelessWidget {
  const RemoveBookMarkDialog({
    super.key,
    required this.bookmarkID,
  });
  final int? bookmarkID;

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
                context
                    .read<ActionsBloc>()
                    .add(DeleteBookmarkEvent(bookmarkID: bookmarkID));
                context.pop();

                showDialog(
                  barrierColor: Colors.transparent,
                  context: context,
                  builder: (context) {
                    return const StateDialog(
                      title: "تمت عملية الحذف بنجاح",
                    );
                  },
                );
              },
              button2: 'إلغاء',
              pressTwo: () {
                context.pop();
                showDialog(
                  barrierColor: Colors.transparent,
                  context: context,
                  builder: (context) {
                    return const StateDialog(
                      title: "تم الإلغاء",
                    );
                  },
                );
              },
            );
          },
        );
      },
      child: Image.asset("lib/assets/icons/bookmarked.png"),
    );
  }
}

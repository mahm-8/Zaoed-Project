import '../../../../../constants/imports.dart';

class AddToBookmarkDialog extends StatefulWidget {
  const AddToBookmarkDialog({
    super.key,
    required this.name,
    required this.location,
    required this.idAuth,
    required this.rate,
    required this.chargingTimes,
    required this.id,
  });
  final String? name, location, idAuth;
  final double? rate;
  final int? id, chargingTimes;

  @override
  State<AddToBookmarkDialog> createState() => _AddToBookmarkDialogState();
}

class _AddToBookmarkDialogState extends State<AddToBookmarkDialog> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // bookmarks.add();
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
                // add bloc
                context.read<UserBloc>().add(AddBookmarkEvent(
                    bookmarkname: widget.name,
                    location: widget.location,
                    rate: widget.rate,
                    chargeTimes: widget.chargingTimes,
                    idAuth: widget.idAuth,
                    id: widget.id));
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
                  context.pop();
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
      child: Image.asset("lib/assets/icons/not_bookmarked.png"),
    );
  }
}

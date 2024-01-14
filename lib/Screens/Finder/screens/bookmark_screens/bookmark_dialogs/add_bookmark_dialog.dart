import 'package:zaoed/blocs/actions_bloc/actions_bloc.dart';
import 'package:zaoed/constants/imports.dart';

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

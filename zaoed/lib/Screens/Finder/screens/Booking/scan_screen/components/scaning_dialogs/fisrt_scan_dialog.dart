import 'package:zaoed/constants/imports.dart';

class ScanFirstDialog extends StatelessWidget {
  const ScanFirstDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return DialogWidgetOneButton(
      title: "تم التحقق بنجاح",
      bodyText: "تمت عملية مسح الباركود  بنجاح، يمكن البدء بشحن مركبتك",
      button1: "حسنًا",
      pressOne: () {
        context
            .read<BottomSheetStatusBloc>()
            .add(TestEvent(status: Status.InProcessing));
        context.push(view: NavigationBarScreen());
      },
    );
  }
}

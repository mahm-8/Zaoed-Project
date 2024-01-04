import 'package:zaoed/Screens/Finder/screens/NavigationBar/navigation_bar.dart';
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
            .add(UpdateStatusEvent(status: Status.InProcessing));
        // push to charging screen
        context.push(view: FinderNavigationBarScreen());
      },
    );
  }
}

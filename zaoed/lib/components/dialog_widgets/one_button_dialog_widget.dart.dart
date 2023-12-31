import 'package:zaoed/constants/imports.dart';

class DialogWidgetOneButton extends StatelessWidget {
  const DialogWidgetOneButton({
    super.key,
    required this.title,
    required this.bodyText,
    required this.button1,
    this.pressOne,
  });
  final String title, bodyText;
  final String button1;

  final Function()? pressOne;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      key: key,
      alignment: Alignment.bottomCenter,
      backgroundColor: AppColors().gray6,
      insetAnimationDuration: const Duration(milliseconds: 100),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
        height: 230,
        width: context.getWidth(),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: AppColors().mainWhite),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                bodyText,
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    color: AppColors().mainWhite),
              ),
              const SizedBox(
                height: 32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  DialogButton(
                    textEntry: button1,
                    backColor: AppColors().green,
                    textColor: AppColors().gray6,
                    onPress: pressOne,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

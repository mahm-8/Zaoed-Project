import 'package:zaoed/constants/imports.dart';

AppBar customAppBar(
  BuildContext context, {
  bool hasAction = false,
  bool showIcon = false,
  String? title,
  String? backTitle,
  Function()? onPress,
}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    centerTitle: true,
    leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Visibility(
          visible: showIcon,
          child: Icon(
            Icons.arrow_back_ios_rounded,
            color: AppColors().mainWhite,
            size: 18,
          ),
        )),
    title: Text(
      title ?? "",
      style: const TextStyle().appBarTitlestyle,
    ),
    actions: [
      Visibility(
        visible: hasAction,
        child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: TextButton(
              onPressed: onPress,
              child: Text(
                backTitle ?? "",
                style: const TextStyle().appBarAction,
              ),
            )),
      ),
      const SizedBox(
        width: 30,
      ),
    ],
  );
}

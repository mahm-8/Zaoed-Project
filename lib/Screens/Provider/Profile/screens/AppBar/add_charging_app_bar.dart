import 'package:zaoed/constants/imports.dart';

AppBar addChargingScreenAppBar(BuildContext context,
    {title, required bool isEditing, final Function()? editFunc}) {
  return AppBar(
    centerTitle: true,
    title: Text(
      title,
      style: TextStyle(color: AppColors().white, fontWeight: FontWeight.w700),
    ),
    backgroundColor: AppColors().gray9,
    leading: TextButton(
        onPressed: () {
          context.pop();
        },
        child: Text(
          'إلغاء',
          style: TextStyle(color: AppColors().white),
        )),
    actions: [
      Visibility(
          visible: isEditing,
          child: TextButton(
              onPressed: editFunc,
              child: Text(
                'تعديل',
                style: TextStyle(color: AppColors().white),
              ))),
    ],
  );
}

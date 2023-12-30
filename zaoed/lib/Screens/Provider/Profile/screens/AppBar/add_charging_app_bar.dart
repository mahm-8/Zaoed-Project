import 'package:zaoed/constants/imports.dart';

AppBar addChargingScreenAppBar(BuildContext context,
    {title, isEditing = false, final Function()? editFunc}) {
  return AppBar(
    centerTitle: true,
    title: Text(
      title,
      style: TextStyle(color: AppColors().white, fontWeight: FontWeight.w700),
    ),
    backgroundColor: AppColors().gray9,
    leading: Visibility(
        visible: isEditing,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 18),
            child: TextButton(
                onPressed: editFunc,
                child: Text(
                  'تعديل',
                  style: TextStyle(color: AppColors().white),
                )))),
    actions: [
      TextButton(
          onPressed: () {
            // show edit charging point dialog
            deleteChargingPointShowDialog(context);
            Future.delayed(const Duration(seconds: 2), () {
              context.pop();
            });
          },
          child: Text(
            'إلغاء',
            style: TextStyle(color: AppColors().white),
          ))
    ],
  );
}

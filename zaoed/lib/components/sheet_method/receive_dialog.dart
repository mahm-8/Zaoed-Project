import 'package:zaoed/blocs/bottom_sheet_status_bloc/bottom_sheet_status_bloc.dart';
import 'package:zaoed/constants/imports.dart';

// String pointName,String timeCharging
extension ReceiveDialog on BuildContext {
  receiveDialog() {
    showBottomSheet(
      enableDrag: true,
      context: this,
      builder: (context) {
        final blocState = context.read<BottomSheetStatusBloc>();
        return Padding(
          padding: const EdgeInsets.only(bottom: 35),
          child: Container(
            decoration: BoxDecoration(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(25)),
                color: AppColors().gray6),
            height: context.getHeight(divide: 2.5),
            width: context.getWidth(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: 100,
                        height: 2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppColors().gray),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text("التوجه إلى نقطة الشحن",
                        style:
                            TextStyle(color: AppColors().white, fontSize: 20)),
                    const SpanText(title: "بقي 5 دقائق حتى الوصول الى الموقع"),
                    const SizedBox(
                      height: 15,
                    ),
                    Text("تفاصيل الحجز",
                        style:
                            TextStyle(color: AppColors().white, fontSize: 20)),
                    SpanText(title: "الموقع:", result: blocState.point),
                    SpanText(title: "نوع الموصل:", result: blocState.image),
                    SpanText(title: "مدة الشحن:", result: "${blocState.hour}"),
                    const SizedBox(
                      height: 15,
                    ),
                    SpanText(
                      title: "الوقت المتبقي لإنتهاء الشحن:",
                      result: "9 دقائق",
                      color: AppColors().green,
                    ),
                    const SizedBox(height: 15),
                    ButtonWidget(
                      onPress: () => showDialog(
                          context: context,
                          builder: (context) {
                            return DialogWidget(
                                imageIcon: ImageIcon(
                                  const AssetImage(
                                      "lib/assets/icons/mingcute_sad-fill.png"),
                                  color: AppColors().green,
                                ),
                                title: "تنبيه!",
                                bodyText:
                                    "هل أنت متأكد من رغبتك في إلغاء حجزك؟",
                                button1: "نعم",
                                button2: "تراجع",
                                pressOne: () {
                                  context.read<BottomSheetStatusBloc>().add(
                                      UpdateStatusEvent(status: Status.nono));

                                  context.pop();
                                  context.pop();
                                  showDialog(
                                    context: context,
                                    builder: (context) =>
                                        const StateDialog(title: "تم الإلغاء"),
                                  );
                                },
                                pressTwo: () {
                                  context.pop();
                                });
                          }),
                      textEntry: "إلغاء الحجز",
                      backColor: AppColors().gray6,
                      textColor: AppColors().green,
                      borderColor: AppColors().green,
                    )
                  ],
                ),
              ]),
            ),
          ),
        );
      },
    );
  }
}

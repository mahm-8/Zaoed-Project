
import 'package:zaoed/constants/imports.dart';

extension ReceiveDialog on BuildContext {
  receiveDialog() {
    showBottomSheet(
      context: this,
      builder: (context) {
        return Container(
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
                    height: 30,
                  ),
                  Text("التوجه إلى نقطة الشحن",
                      style: TextStyle(color: AppColors().white, fontSize: 20)),
                  const SpanText(title: "بقي 5 دقائق حتى الوصول الى الموقع"),
                  const SizedBox(
                    height: 15,
                  ),
                  Text("تفاصيل الحجز",
                      style: TextStyle(color: AppColors().white, fontSize: 20)),
                  const SpanText(title: "الموقع:", result: " منزل إيلاف"),
                  const SpanText(
                      title: "نوع الموصل:",
                      image: "lib/assets/icons/Type 1.png"),
                  const SpanText(title: "مدة الشحن:", result: " 3 ساعات"),
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
                              bodyText: "هل أنت متأكد من رغبتك في إلغاء حجزك؟",
                              button1: "نعم",
                              button2: "تراجع",
                              pressOne: () {
                                context.pop();
                                context.pop();
                                showDialog(
                                  context: context,
                                  builder: (context) =>
                                      const StateDialog(title: "تم الإلغاء"),
                                );
                              },
                              pressTwo: () => context.pop());
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
        );
      },
    );
  }
}

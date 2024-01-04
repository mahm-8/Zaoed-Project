import 'package:zaoed/constants/imports.dart';
import 'package:zaoed/extensions/text_style.dart';

extension ArrivedSheet on BuildContext {
  arrivedToCharging(
      {ChargingPoint? chargingPoint, CarBookingModel? carBooking}) {
    showBottomSheet(
      context: this,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(25)),
              color: AppColors().gray6),
          height: context.getHeight(divide: 2),
          width: context.getWidth(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  Text("وصلت لنقطة الشحن",
                      style: const TextStyle().dialogStyle1),
                  const SizedBox(
                    height: 10,
                  ),
                  Text("لبدء عملية الشحن الرجاء مسح الكود",
                      style: const TextStyle().style3),
                  SpanText(
                    resultTitle: 18,
                    sizeTitle: 18,
                    title: "الوقت المتبقي لإنتهاء وقت الحجز:",
                    result: " 9 دقائق",
                    color: AppColors().green,
                  ),
                  const SizedBox(height: 15),
                  ButtonWidget(
                    onPress: () {
                      ////////////////////////////////////////
                      /// send charging point data
                      context.push(
                          view: ScanBarcodeScreen(
                        chargingPoint: chargingPoint,
                        carBooking: carBooking,
                      ));
                    },
                    textEntry: "مسح الباركود",
                    backColor: AppColors().green,
                    textColor: AppColors().gray6,
                    borderColor: AppColors().green,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
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

import 'package:zaoed/constants/imports.dart';

extension ChargingCarSheet on BuildContext {
  chargingCarSheet() {
    showBottomSheet(
      enableDrag: true,
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
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 35,
                ),
                Row(
                  children: [
                    Text("يتم شحن مركبتك",
                        style: const TextStyle().dialogStyle1),
                    const SizedBox(width: 8),
                    SizedBox(
                      height: 15,
                      width: 15,
                      child: Center(
                          child: CircularProgressIndicator(
                        backgroundColor: AppColors().gray5,
                        color: AppColors().green,
                        strokeAlign:
                            CircularProgressIndicator.strokeAlignCenter,
                        strokeWidth: 2,
                        strokeCap: StrokeCap.round,
                      )),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                    "يمكنك معرفة تفاصيل أكثر من خلال \nالذهاب إلى خانة معلومات المركبة",
                    style: const TextStyle().style4),
                const SizedBox(height: 25),
                ButtonWidget(
                  onPress: () {},
                  textEntry: "متابعة عملية الشحن",
                  backColor: AppColors().green,
                  textColor: AppColors().gray6,
                  borderColor: AppColors().green,
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

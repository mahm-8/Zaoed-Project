import 'package:zaoed/constants/imports.dart';

class ChargingStatusFinishedScreen extends StatelessWidget {
  const ChargingStatusFinishedScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const ChargingCarFinished(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 151),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'انتهت عملية الشحن',
                  style: TextStyle(color: AppColors().white, fontSize: 18),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  '''يمكنك استلام مركبتك الآن! نأمل منك إتمام عملية
                       الاستلام خلال 20 دقيقة''',
                  style: TextStyle(
                    color: AppColors().gray,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ButtonWidget(
                    textEntry: 'استلام المركبة',
                    backColor: AppColors().green,
                    onPress: () {},
                    textColor: AppColors().black)
              ],
            ),
          )
        ],
      ),
    );
  }
}

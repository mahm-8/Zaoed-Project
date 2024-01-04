import 'package:zaoed/constants/imports.dart';
import 'package:zaoed/extensions/text_style.dart';

class ChargingStatusFinishedScreen extends StatelessWidget {
  const ChargingStatusFinishedScreen({super.key});
  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return Scaffold(
      backgroundColor: AppColors().gray9,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ChargingCarFinished(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 151),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'انتهت عملية الشحن',
                    style: TextStyle().style9,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    '''يمكنك استلام مركبتك الآن! نأمل منك إتمام عملية
=======
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
>>>>>>> 67c72e5dced85de035492b5da477599d5729dd3c
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

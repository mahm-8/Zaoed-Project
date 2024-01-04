import 'package:zaoed/constants/imports.dart';

class ChargeSpeedContainer extends StatelessWidget {
  const ChargeSpeedContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      width: context.getWidth(),
      decoration: BoxDecoration(
          color: AppColors().gray1Trans,
          borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Row(
              children: [
                Checkbox(
                    activeColor: AppColors().green,
                    checkColor: AppColors().mainWhite,
                    side: BorderSide(color: AppColors().mainWhite),
                    value: false,
                    onChanged: ((value) {
                      value = value;
                    })),
                Text(
                  "سرعة الشحن (>kw 3.7)",
                  style: const TextStyle().style22,
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                    activeColor: AppColors().green,
                    checkColor: AppColors().mainWhite,
                    side: BorderSide(color: AppColors().mainWhite),
                    value: false,
                    onChanged: ((value) {
                      value = value;
                    })),
                Text(
                  "شبه سريعة (3.7 - 20 kw>)",
                  style: const TextStyle().style22,
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                    activeColor: AppColors().green,
                    checkColor: AppColors().mainWhite,
                    side: BorderSide(color: AppColors().mainWhite),
                    value: false,
                    onChanged: ((value) {
                      value = value;
                    })),
                Text(
                  "سريعة (20 - 43 kw>)",
                  style: const TextStyle().style22,
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                    activeColor: AppColors().green,
                    checkColor: AppColors().mainWhite,
                    side: BorderSide(color: AppColors().mainWhite),
                    value: false,
                    onChanged: ((value) {
                      /// setstate
                      value = value;
                    })),
                Text(
                  "فائقة السرعة (43 kw<)",
                  style: const TextStyle().style22,
                ),
              ],
            ),

            //
          ],
        ),
      ),
    );
  }
}

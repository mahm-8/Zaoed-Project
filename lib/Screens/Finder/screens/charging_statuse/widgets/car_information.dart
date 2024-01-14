import 'package:zaoed/constants/imports.dart';

class CarInformation extends StatelessWidget {
  const CarInformation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'تسلا موديل X',
          style: const TextStyle().style3,
        ),
        const Spacer(),
        Container(
          width: 80,
          height: 23,
          padding: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            color: AppColors().green,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  'جاري الشحن',
                  style: const TextStyle().style26,
                ),
              ),
              Image.asset('lib/assets/icons/black_logo.png'),
            ],
          ),
        ),
        const SizedBox(
          width: 6,
        ),
      ],
    );
  }
}

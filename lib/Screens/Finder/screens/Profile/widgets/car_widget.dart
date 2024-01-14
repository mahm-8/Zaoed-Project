import 'package:zaoed/constants/imports.dart';

class CarWidget extends StatelessWidget {
  const CarWidget({
    super.key,
    required this.car,
  });
  final CarModel? car;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      height: context.getHeight(divide: 8),
      width: context.getWidth(divide: 1.2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: AppColors().gray6),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    car?.brand ?? "",
                    style: const TextStyle().style6,
                  ),
                ],
              ),
              TextButton(
                  style: TextButton.styleFrom(
                      enableFeedback: true, foregroundColor: AppColors().green),
                  onPressed: () {},
                  child: Text(
                    "بيانات السيارة",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors().green),
                  ))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(car?.model ?? "", style: const TextStyle().style27),
              SizedBox(
                height: 30,
                child: VerticalDivider(
                  color: AppColors().black,
                ),
              ),
              Text(car?.type ?? "", style: const TextStyle().style27)
            ],
          )
        ],
      ),
    );
  }
}

import 'package:zaoed/constants/imports.dart';
import 'package:zaoed/Screens/Provider/Profile/screens/ScreensWidgets/count_widget.dart';

class ChargingType extends StatelessWidget {
  const ChargingType({
    super.key,
    required this.imageUrl,
    required this.count,
    required this.type,
    this.onTap,
    this.increment,
    this.decrement,
    this.isClicked = false,
  });
  final String imageUrl;
  final int count;
  final String type;
  final Function()? onTap;
  final Function()? increment;
  final Function()? decrement;
  final bool isClicked;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
        child: Column(
          children: [
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: isClicked ? AppColors().green : AppColors().gray6,
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                child: Column(
                  children: [
                    Image.asset(imageUrl),
                    Text(
                      type,
                      style: const TextStyle().style37,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Container(
              height: 24,
              width: 72,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors().gray6),
              ),
              child: CountWidget(
                  increment: increment, decrement: decrement, count: count),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:zaoed/constants/imports.dart';

class ChargersWidget extends StatelessWidget {
  const ChargersWidget({
    super.key,
    required this.imageAsset,
    required this.name, required this.isSelected,
  });

  final String imageAsset, name;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 78,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: isSelected ? AppColors().green : AppColors().gray6)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              imageAsset,
            ),
            Text(
              name,
              style: TextStyle(color: AppColors().white, fontSize: 10),
            )
          ],
        ),
      ),
    );
  }
}

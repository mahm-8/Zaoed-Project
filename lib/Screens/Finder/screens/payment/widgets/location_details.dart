import 'package:zaoed/constants/imports.dart';

class LocationDetails extends StatelessWidget {
  const LocationDetails({
    super.key,
    this.namePoint,
  });
  final String? namePoint;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 40,
          width: context.getWidth(),
          decoration: BoxDecoration(
              color: AppColors().gray6, borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Text(
              namePoint ?? "",
              style: const TextStyle().style6,
            ),
          ),
        ),
      ],
    );
  }
}

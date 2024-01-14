import 'package:zaoed/constants/imports.dart';

class MapBackground extends StatelessWidget {
  const MapBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.getWidth(),
      child: Image.asset(
        "lib/assets/images/MAP.png",
        height: 500,
        fit: BoxFit.cover,
      ),
    );
  }
}

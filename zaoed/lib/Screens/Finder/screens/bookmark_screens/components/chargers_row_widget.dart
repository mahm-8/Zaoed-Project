import 'package:zaoed/constants/imports.dart';
import 'package:zaoed/extensions/text_style.dart';

class ChargersRowWidget extends StatelessWidget {
  const ChargersRowWidget({
    super.key,
    required this.portCount,
    required this.chargingPort,
  });
  final int? portCount;
  final String? chargingPort;

// edit on this to add port lists
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset("lib/assets/icons/TeslaDC.png"),
        const SizedBox(
          width: 2,
        ),
        Text(
          "$portCount x",
          style: const TextStyle().style24,
        ),
        const SizedBox(
          width: 22,
        ),
        Image.asset("lib/assets/icons/TeslaDC.png"),
        const SizedBox(
          width: 2,
        ),
        Text(
          "0x",
          style: const TextStyle().style24,
        ),
        const SizedBox(
          width: 22,
        ),
        Image.asset("lib/assets/icons/TeslaDC.png"),
        const SizedBox(
          width: 2,
        ),
        Text(
          "0x",
          style: const TextStyle().style24,
        ),
        const SizedBox(
          width: 22,
        ),
        Image.asset("lib/assets/icons/TeslaDC.png"),
        const SizedBox(
          width: 2,
        ),
        Text("0x", style: const TextStyle().style24),
        const SizedBox(
          width: 22,
        ),
      ],
    );
  }
}

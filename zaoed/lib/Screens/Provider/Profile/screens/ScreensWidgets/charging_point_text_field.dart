import 'package:zaoed/constants/imports.dart';

class AddChargingPointTextField extends StatelessWidget {
  const AddChargingPointTextField({
    super.key,
    required this.textController,
  });

  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'اسم نقطة الشحن',
          style: TextStyle(color: AppColors().white, fontSize: 20),
        ),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
          height: 48,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border(
                  top: BorderSide(color: AppColors().green, width: 0.3),
                  left: BorderSide(color: AppColors().green, width: 0.3)),
            ),
            child: TextField(
              controller: textController,
              decoration: InputDecoration(
                fillColor: AppColors().gray6,
                filled: true,
                hintText: 'المنزل,العمل...',
                hintStyle: const TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

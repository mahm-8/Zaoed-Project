import 'package:zaoed/constants/imports.dart';

class BankTextField extends StatelessWidget {
  const BankTextField({
    super.key,
    required this.controller,
    required this.hint,
    required this.label,
  });

  final TextEditingController controller;
  final String hint;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle().style6,
          ),
          const SizedBox(
            height: 8,
          ),
          SizedBox(
            height: 48,
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                  fillColor: AppColors().gray6,
                  filled: true,
                  hintText: hint,
                  hintStyle: const TextStyle(color: Colors.grey),
                  border: OutlineStyle.defaultBorder),
            ),
          )
        ],
      ),
    );
  }
}

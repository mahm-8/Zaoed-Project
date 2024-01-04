import 'package:zaoed/constants/imports.dart';

class FieldTextWidget extends StatelessWidget {
  const FieldTextWidget(
      {super.key,
      required this.title,
      this.maxLines = 1,
      this.hint = "",
      this.keyboardType = TextInputType.text,
      this.isFelid = true,
      this.onTap,
      this.controller});

  final String title;
  final String hint;
  final int maxLines;

  final TextInputType? keyboardType;
  final bool isFelid;
  final Function()? onTap;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle().style4,
            ),
            InkWell(
              onTap: !isFelid ? onTap : null,
              child: TextField(
                style: const TextStyle().style13,
                controller: controller,
                minLines: maxLines,
                maxLines: maxLines,
                enabled: isFelid,
                keyboardType: keyboardType,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  fillColor: AppColors().gray6,
                  filled: true,
                  hintStyle: TextStyle(color: AppColors().white),
                  hintText: hint,
                  focusedErrorBorder: OutlineStyle.default15Outline,
                  enabledBorder: OutlineStyle.default15Outline,
                  focusedBorder: OutlineStyle.default15Outline,
                  errorBorder: OutlineStyle.default15Outline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

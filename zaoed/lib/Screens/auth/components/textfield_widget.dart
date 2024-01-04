
import '../../../constants/imports.dart';

class TextfieldWidget extends StatelessWidget {
  const TextfieldWidget(
      {super.key,
      required this.hint,
      this.obscure = false,
      required this.controller,
      this.keyForm,
      this.validator,
      this.displayPass = false,
      this.onTap,
      this.keyboardType});

  final TextInputType? keyboardType;
  final String hint;
  final bool obscure;
  final TextEditingController? controller;
  final GlobalKey? keyForm;
  final String? Function(String?)? validator;
  final bool displayPass;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Form(
        key: keyForm,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: TextFormField(
            maxLines: 1,
            cursorColor: AppColors().green,
            keyboardType: keyboardType,
            validator: validator,
            obscureText: !obscure ? false : !displayPass,
            controller: controller,
            style: const TextStyle().style13,
            decoration: InputDecoration(
              fillColor: AppColors().gray1Trans,
              filled: true,
              suffixIcon: !obscure
                  ? null
                  : InkWell(
                      onTap: onTap,
                      child: Icon(
                        !displayPass
                            ? Icons.visibility_off_sharp
                            : Icons.remove_red_eye,
                      ),
                    ),
              hintText: hint,
              hintStyle: const TextStyle().style15,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              focusedErrorBorder: OutlineStyle.deafultTextfieldError,
              enabledBorder: OutlineStyle.defaultTextfieldEnabled,
              focusedBorder: OutlineStyle.defaultTextfieldfocused,
              errorBorder: OutlineStyle.defaultTextfieldError,
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:zaoed/constants/imports.dart';

InputDecoration buildInputDecoration(
    {required String hintText, bool addNetworkIcons = false}) {
  return InputDecoration(
      suffixIcon: addNetworkIcons ? const NetworkIcons() : null,
      hintText: hintText,
      focusedErrorBorder: OutlineStyle.defaultErrorBorder,
      enabledBorder: OutlineStyle.defaultEnabledBorder,
      focusedBorder: OutlineStyle.defaultFocusedBorder,
      errorBorder: OutlineStyle.defaultErrorBorder,
      contentPadding: const EdgeInsets.all(8.0));
}

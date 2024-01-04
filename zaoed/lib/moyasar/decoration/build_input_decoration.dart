import 'package:flutter/material.dart';
import 'package:zaoed/extensions/outline_style.dart';
import 'package:zaoed/moyasar/widget/network_icon.dart';

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

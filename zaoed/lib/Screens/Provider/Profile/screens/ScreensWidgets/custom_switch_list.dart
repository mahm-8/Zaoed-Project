import 'package:flutter/material.dart';

class CustomSwitchListTile extends StatelessWidget {
  const CustomSwitchListTile({
    super.key,
    required this.value,
    required this.onChanged,
    required this.title,
    this.textColor = Colors.white,
  });
  final bool value;
  final ValueChanged<bool>? onChanged;
  final String title;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.9,
      child: SwitchListTile(
        title: Text(
          title,
          style: TextStyle(color: textColor, fontSize: 18),
        ),
        value: value,
        onChanged: onChanged,
        contentPadding: EdgeInsets.zero,
        dense: true,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shop_flow/core/utils/app_font_styles.dart';

class CustomIconElevatedButton extends StatelessWidget {
  const CustomIconElevatedButton({
    super.key,
    required this.label,
    required this.icon,
    this.backgroundColor,
    this.foregroundColor,
    this.radius,
  });
  final String label;
  final IconData icon;
  final Color? backgroundColor, foregroundColor;
  final double? radius;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        foregroundColor: foregroundColor,
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(radius ?? 16),
        ),
      ),
      icon: Icon(icon),
      onPressed: () {},
      label: Text(label, style: AppFontStyles.styleRegular16),
    );
  }
}

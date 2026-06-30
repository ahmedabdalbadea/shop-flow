import 'package:flutter/material.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/utils/app_font_styles.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.title,
    this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.borderColor = const Color(0xFF000000),
    this.radius,
    this.borderWidth = 1.0,
  });
  final String title;
  final void Function()? onPressed;
  final Color? backgroundColor, foregroundColor;
  final Color borderColor;
  final double? radius;
  final double borderWidth;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? kBorderRadiusCircular),
          side: BorderSide(color: borderColor, width: borderWidth),
        ),
      ),
      onPressed: onPressed,
      child: Text(title, style: AppFontStyles.styleSemiBold14),
    );
  }
}

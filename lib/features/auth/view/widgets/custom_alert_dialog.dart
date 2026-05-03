import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shop_flow/core/utils/app_font_styles.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    super.key,
    required this.icon,
    required this.msg,
    required this.canPop,
  });
  final String icon, msg;
  final bool canPop;
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: canPop,
      child: AlertDialog(
        icon: Lottie.asset(icon, height: 200),
        content: Text(
          msg,
          textAlign: TextAlign.center,
          style: AppFontStyles.styleSemiBold16,
        ),
      ),
    );
  }
}

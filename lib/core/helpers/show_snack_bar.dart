import 'package:flutter/material.dart';

void showSnackbar(
  BuildContext context, {
  required String title,
  Color? textColor,
  Color? backgroundColor,
  String? actionLabel,
  VoidCallback? onActionPressed,
}) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        title,
        style: TextStyle(color: textColor ?? Colors.black87),
      ),
      backgroundColor: backgroundColor ?? const Color(0xFFE8F5E9),
      duration: const Duration(seconds: 2),
      action: actionLabel != null && onActionPressed != null
          ? SnackBarAction(
              label: actionLabel,
              textColor: const Color(0xFF2E7D32),
              onPressed: onActionPressed,
            )
          : null,
    ),
  );
}

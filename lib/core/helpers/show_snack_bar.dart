import 'package:flutter/material.dart';

void showSnackbar(
  BuildContext context, {
  required String title,
  Color? backgroundColor,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(title),
      backgroundColor: backgroundColor ?? Colors.lightGreenAccent,
      duration: const Duration(seconds: 2),
    ),
  );
}

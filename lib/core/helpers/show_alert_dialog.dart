import 'package:flutter/material.dart';
import 'package:shop_flow/features/auth/view/widgets/custom_alert_dialog.dart';

bool _isDialogOpen = false;

void showAlertDialog(
  BuildContext context, {
  required String msg,
  required String icon,
  required bool barrierDismissible,
}) {
  if (_isDialogOpen) {
    Navigator.of(context).pop();
  }
  _isDialogOpen = true;
  showDialog(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (context) {
      return CustomAlertDialog(
        icon: icon,
        msg: msg,
        canPop: barrierDismissible,
      );
    },
  ).then((_) => _isDialogOpen = false);
}

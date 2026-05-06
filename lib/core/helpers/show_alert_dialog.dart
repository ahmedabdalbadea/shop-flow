import 'package:flutter/material.dart';
import 'package:shop_flow/features/auth/view/widgets/custom_alert_dialog.dart';

bool isDialogOpen = false;

void showAlertDialog(
  BuildContext context, {
  required String msg,
  required String icon,
  required bool barrierDismissible,
  bool repeat = false,
}) {
  showDialog(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (context) {
      return CustomAlertDialog(
        icon: icon,
        msg: msg,
        canPop: barrierDismissible,
        repeat: repeat,
      );
    },
  ).then((_) {
    isDialogOpen = false;
  });
}

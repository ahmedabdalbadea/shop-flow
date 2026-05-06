import 'package:flutter/material.dart';
import 'package:shop_flow/core/helpers/show_alert_dialog.dart';

void closeAlertDialog(BuildContext context) {
  if (isDialogOpen) {
    Navigator.pop(context);
    isDialogOpen = false;
  }
}

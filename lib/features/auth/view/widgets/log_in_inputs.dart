import 'package:flutter/material.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/utlis/app_font_styles.dart';
import 'package:shop_flow/core/widget/user_input.dart';

class LogInInputs extends StatelessWidget {
  const LogInInputs({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text("Email", style: AppFontStyles.styleSemiBold14),
        ),
        const SizedBox(height: 8),
        UserInput(hint: "name@example.com"),
      ],
    );
  }
}

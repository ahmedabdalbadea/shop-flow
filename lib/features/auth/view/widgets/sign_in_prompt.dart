import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/utils/app_font_styles.dart';
import 'package:shop_flow/generated/l10n.dart';

class SignInPrompt extends StatelessWidget {
  const SignInPrompt({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          S.of(context).alreadyHaveAccount,
          style: AppFontStyles.styleRegular14.copyWith(color: kThrTextColor),
        ),

        GestureDetector(
          onTap: () {
            GoRouter.of(context).pop();
          },
          child: Text(
            S.of(context).signIn,
            style: AppFontStyles.styleRegular14.copyWith(color: kSecTextColor),
          ),
        ),
      ],
    );
  }
}

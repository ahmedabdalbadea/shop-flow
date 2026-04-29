import 'package:flutter/material.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/utlis/app_font_styles.dart';
import 'package:shop_flow/generated/l10n.dart';

class SplashTagline extends StatelessWidget {
  const SplashTagline({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "ShopFlow",
          style: AppFontStyles.styleBold32.copyWith(color: kPrimaryColor),
        ),
        const SizedBox(height: 8),
        Text(
          S.of(context).splashTagline,
          style: AppFontStyles.styleRegular14,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

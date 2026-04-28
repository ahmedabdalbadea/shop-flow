import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/utlis/app_font_styles.dart';
import 'package:shop_flow/core/utlis/assets_images.dart';
import 'package:shop_flow/core/widget/custom_elevated_button.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          const Spacer(flex: 3),
          SvgPicture.asset(
            AssetsImages.appLogo,
            width: MediaQuery.widthOf(context) * 0.35,
          ),
          Text(
            "ShopFlow",
            style: AppFontStyles.styleBold32.copyWith(color: kPrimaryColor),
          ),
          const SizedBox(height: 8),
          Text(
            "Seamless shopping for the modern lifestyle.",
            style: AppFontStyles.styleRegular14,
            textAlign: TextAlign.center,
          ),
          const Spacer(flex: 2),

          CustomElevatedButton(title: "Get Started", onPressed: () {}),

          const Spacer(flex: 1),
        ],
      ),
    );
  }
}

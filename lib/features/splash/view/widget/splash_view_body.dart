import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/utlis/app_font_styles.dart';
import 'package:shop_flow/core/utlis/assets_images.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(AssetsImages.appLogo),
        Text(
          "ShopFlow",
          style: AppFontStyles.styleBold32.copyWith(color: kPrimaryColor),
        ),
        Text(
          "Seamless shopping for the modern\nlifestyle.",
          style: AppFontStyles.styleRegular16,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 186),
      ],
    );
  }
}

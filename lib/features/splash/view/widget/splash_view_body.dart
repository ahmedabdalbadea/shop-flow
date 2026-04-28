import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/utlis/app_font_styles.dart';
import 'package:shop_flow/core/utlis/assets_images.dart';
import 'package:shop_flow/core/widget/custom_elevated_button.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  double _logoOpacity = 0;
  double _textOpacity = 0;
  Offset _textOffset = const Offset(0, 0.4);
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _animateLogo();

      Future.delayed(const Duration(milliseconds: 1200), () {
        if (mounted) _animateText();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          const Spacer(flex: 3),
          // logo
          AnimatedOpacity(
            duration: kAnimationDuration,
            opacity: _logoOpacity,
            curve: Curves.easeInOutCirc,
            child: SvgPicture.asset(
              AssetsImages.appLogo,
              width: MediaQuery.widthOf(context) * 0.35,
            ),
          ),

          // tagline
          AnimatedSlide(
            duration: kAnimationDuration,
            offset: _textOffset,
            curve: Curves.easeOut,
            child: AnimatedOpacity(
              opacity: _textOpacity,
              duration: kAnimationDuration,
              curve: Curves.easeOut,
              child: _buildTagline(),
            ),
          ),

          const Spacer(flex: 2),

          // Get started button
          CustomElevatedButton(title: "Get Started", onPressed: () {}),

          const Spacer(flex: 1),
        ],
      ),
    );
  }

  Column _buildTagline() {
    return Column(
      children: [
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
      ],
    );
  }

  void _animateText() {
    setState(() {
      _textOpacity = 1;
      _textOffset = Offset.zero;
    });
  }

  void _animateLogo() {
    setState(() {
      _logoOpacity = 1;
    });
  }
}

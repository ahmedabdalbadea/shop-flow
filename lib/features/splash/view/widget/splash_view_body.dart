import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/utlis/app_router.dart';
import 'package:shop_flow/core/utlis/assets_images.dart';
import 'package:shop_flow/core/widget/custom_elevated_button.dart';
import 'package:shop_flow/features/splash/view/widget/splash_tagline.dart';
import 'package:shop_flow/generated/l10n.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  double _logoOpacity = 0;
  double _taglineOpacity = 0;
  Offset _taglinePosition = const Offset(0, 0.4);
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _animateLogo();

      Future.delayed(const Duration(milliseconds: 1200), () {
        if (mounted) _animateTagline();
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
          // Logo
          AnimatedOpacity(
            duration: kAnimationDuration,
            opacity: _logoOpacity,
            curve: Curves.easeInOutCirc,
            child: SvgPicture.asset(
              AssetsImages.appLogo,
              width: MediaQuery.widthOf(context) * 0.35,
            ),
          ),

          // Tagline
          AnimatedSlide(
            duration: kAnimationDuration,
            offset: _taglinePosition,
            curve: Curves.easeOut,
            child: AnimatedOpacity(
              opacity: _taglineOpacity,
              duration: kAnimationDuration,
              curve: Curves.easeOut,
              child: const SplashTagline(),
            ),
          ),

          const Spacer(flex: 2),

          // Get started button
          CustomElevatedButton(
            title: S.of(context).start,
            onPressed: () {
              // Navigate to Signin
              GoRouter.of(context).push(AppRouter.kSignInView);
            },
          ),

          const Spacer(flex: 1),
        ],
      ),
    );
  }

  void _animateTagline() {
    setState(() {
      _taglineOpacity = 1;
      _taglinePosition = Offset.zero;
    });
  }

  void _animateLogo() {
    setState(() {
      _logoOpacity = 1;
    });
  }
}

import 'package:flutter/material.dart';
import 'package:shop_flow/core/utils/app_font_styles.dart';
import 'package:shop_flow/core/utils/assets_images.dart';
import 'package:shop_flow/core/widget/custom_elevated_button.dart';
import 'package:shop_flow/features/auth/view/widgets/icon_label_button.dart';
import 'package:shop_flow/features/auth/view/widgets/sign_in_inputs.dart';
import 'package:shop_flow/features/auth/view/widgets/onboarding_card.dart';
import 'package:shop_flow/features/auth/view/widgets/or_divider.dart';

class SignInViewBody extends StatelessWidget {
  const SignInViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: OnboardingCard(
            child: Column(
              children: [
                Text("Welcome back", style: AppFontStyles.styleSemiBold24),
                const SizedBox(height: 8),
                Text(
                  "Sign in to your ShopFlow account",
                  style: AppFontStyles.styleRegular14,
                ),
                const SizedBox(height: 32),
                SignInInputs(),
                const SizedBox(height: 16),
                CustomElevatedButton(title: "Sign In", onPressed: () {}),
                const SizedBox(height: 32),
                const OrDivider(),
                const SizedBox(height: 32),
                IconLabelButton(
                  icon: AssetsImages.googleLogo,
                  label: "Continue with Google",
                  onPressed: () {},
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}

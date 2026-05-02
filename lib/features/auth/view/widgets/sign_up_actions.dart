import 'package:flutter/material.dart';
import 'package:shop_flow/core/utils/assets_images.dart';
import 'package:shop_flow/core/widget/custom_elevated_button.dart';
import 'package:shop_flow/features/auth/view/widgets/icon_label_button.dart';
import 'package:shop_flow/features/auth/view/widgets/or_divider.dart';

class SignUpActions extends StatelessWidget {
  const SignUpActions({super.key, required, required this.formKey});
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomElevatedButton(title: "Sign In", onPressed: () {}),
        const SizedBox(height: 26),
        const OrDivider(),
        const SizedBox(height: 26),
        IconLabelButton(
          icon: AssetsImages.googleLogo,
          label: "Continue with Google",
          onPressed: () {},
        ),
      ],
    );
  }
}

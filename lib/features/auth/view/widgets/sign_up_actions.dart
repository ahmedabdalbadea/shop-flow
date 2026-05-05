import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_flow/core/utils/assets.dart';
import 'package:shop_flow/core/widget/custom_elevated_button.dart';
import 'package:shop_flow/features/auth/manager/auth_cubit/auth_cubit.dart';
import 'package:shop_flow/features/auth/view/widgets/icon_label_button.dart';
import 'package:shop_flow/features/auth/view/widgets/or_divider.dart';

class SignUpActions extends StatelessWidget {
  const SignUpActions({super.key, required void Function() validateForm})
    : _validateForm = validateForm;
  final VoidCallback _validateForm;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomElevatedButton(title: "Sign Up", onPressed: _validateForm),
        const SizedBox(height: 26),
        const OrDivider(),
        const SizedBox(height: 26),
        IconLabelButton(
          icon: Assets.googleLogo,
          label: "Continue with Google",
          onPressed: () {
            context.read<AuthCubit>().signInWithGoogle();
          },
        ),
      ],
    );
  }
}

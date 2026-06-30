import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/utils/assets.dart';
import 'package:shop_flow/core/widget/custom_elevated_button.dart';
import 'package:shop_flow/features/auth/manager/auth_cubit/auth_cubit.dart';
import 'package:shop_flow/features/auth/view/widgets/icon_label_button.dart';
import 'package:shop_flow/features/auth/view/widgets/or_divider.dart';
import 'package:shop_flow/generated/l10n.dart';

class SignUpActions extends StatelessWidget {
  const SignUpActions({super.key, required void Function() validateForm})
    : _validateForm = validateForm;
  final VoidCallback _validateForm;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 65,
          width: double.infinity,
          child: CustomElevatedButton(
            foregroundColor: Colors.white,
            backgroundColor: kPrimaryColor,
            title: S.of(context).signUp,
            onPressed: _validateForm,
          ),
        ),
        const SizedBox(height: 26),
        const OrDivider(),
        const SizedBox(height: 26),
        IconLabelButton(
          icon: Assets.googleLogo,
          label: S.of(context).continueWithGoogle,
          onPressed: () {
            context.read<AuthCubit>().signInWithGoogle();
          },
        ),
      ],
    );
  }
}

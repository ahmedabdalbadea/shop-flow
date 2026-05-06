import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/utils/app_font_styles.dart';
import 'package:shop_flow/core/utils/app_router.dart';
import 'package:shop_flow/features/auth/manager/auth_cubit/auth_cubit.dart';
import 'package:shop_flow/generated/l10n.dart';

class SignUpPrompt extends StatelessWidget {
  const SignUpPrompt({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          S.of(context).dontHaveAccount,
          style: AppFontStyles.styleRegular14.copyWith(color: kThrTextColor),
        ),

        GestureDetector(
          onTap: () {
            GoRouter.of(
              context,
            ).push(AppRouter.kSignUpView, extra: context.read<AuthCubit>());
          },
          child: Text(
            S.of(context).signUp,
            style: AppFontStyles.styleRegular14.copyWith(color: kSecTextColor),
          ),
        ),
      ],
    );
  }
}

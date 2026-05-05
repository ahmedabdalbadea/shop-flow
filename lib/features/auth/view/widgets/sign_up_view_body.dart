import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/helpers/show_alert_dialog.dart';
import 'package:shop_flow/core/utils/app_font_styles.dart';
import 'package:shop_flow/core/utils/assets.dart';
import 'package:shop_flow/features/auth/manager/cubit/auth_cubit.dart';
import 'package:shop_flow/features/auth/view/widgets/onboarding_card.dart';
import 'package:shop_flow/features/auth/view/widgets/sign_in_prompt.dart';
import 'package:shop_flow/features/auth/view/widgets/sign_up_inputs.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is SignUpSuccess || state is GoogleSignInSuccess) {
              showAlertDialog(
                context,
                msg: "Success",
                icon: Assets.animationSuccess,
                barrierDismissible: false,
              );
            } else if (state is AuthFailureState) {
              showAlertDialog(
                context,
                msg: state.errMsg,
                icon: Assets.animationFailure,
                barrierDismissible: true,
              );
            } else {
              showAlertDialog(
                context,
                msg: "Loading...",
                icon: Assets.animationTrailLoading,
                barrierDismissible: false,
              );
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: OnboardingCard(
              child: Column(
                children: [
                  Text("Create Account", style: AppFontStyles.styleSemiBold24),
                  const SizedBox(height: 8),
                  Text(
                    "Join the ShopFlow community",
                    style: AppFontStyles.styleRegular14.copyWith(
                      color: kThrTextColor,
                    ),
                  ),
                  const SizedBox(height: 26),
                  const SignUpInputs(),

                  const SizedBox(height: 26),
                  const SignInPrompt(),
                ],
              ),
            ),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}

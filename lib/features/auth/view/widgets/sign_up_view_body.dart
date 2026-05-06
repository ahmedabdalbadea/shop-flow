import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/helpers/close_alert_dialog.dart';
import 'package:shop_flow/core/helpers/show_alert_dialog.dart';
import 'package:shop_flow/core/utils/app_font_styles.dart';
import 'package:shop_flow/core/utils/app_router.dart';
import 'package:shop_flow/core/utils/assets.dart';
import 'package:shop_flow/features/auth/manager/auth_cubit/auth_cubit.dart';
import 'package:shop_flow/features/auth/view/widgets/onboarding_card.dart';
import 'package:shop_flow/features/auth/view/widgets/sign_in_prompt.dart';
import 'package:shop_flow/features/auth/view/widgets/sign_up_inputs.dart';
import 'package:shop_flow/generated/l10n.dart';

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
              closeAlertDialog(context); // If dialog is open -> Close it
              showAlertDialog(
                context,
                msg: S.of(context).signUpSuccess,
                icon: Assets.animationSuccess,
                barrierDismissible: true,
              );
              isDialogOpen = true;
              Future.delayed(Duration(seconds: 1), () {
                context.go(AppRouter.kHomeView);
              });
            } else if (state is AuthFailureState) {
              closeAlertDialog(context); // If dialog is open -> Close it
              showAlertDialog(
                context,
                msg: state.errMsg,
                icon: Assets.animationFailure,
                barrierDismissible: true,
              );
              isDialogOpen = true;
            } else {
              showAlertDialog(
                context,
                msg: S.of(context).loading,
                icon: Assets.animationTrailLoading,
                barrierDismissible: false,
                repeat: true,
              );
              isDialogOpen = true;
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: OnboardingCard(
              child: Column(
                children: [
                  Text(
                    S.of(context).createAccount,
                    style: AppFontStyles.styleSemiBold24,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    S.of(context).joinCommunity,
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

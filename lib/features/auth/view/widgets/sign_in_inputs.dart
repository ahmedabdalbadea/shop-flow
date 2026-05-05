import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/utils/app_font_styles.dart';
import 'package:shop_flow/core/utils/form_validators.dart';
import 'package:shop_flow/core/widget/user_input.dart';
import 'package:shop_flow/features/auth/manager/auth_cubit/auth_cubit.dart';
import 'package:shop_flow/features/auth/view/widgets/sign_in_actions.dart';

class SignInInputs extends StatefulWidget {
  const SignInInputs({super.key});

  @override
  State<SignInInputs> createState() => _SignInInputsState();
}

class _SignInInputsState extends State<SignInInputs> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  String? _email, _password;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: _autovalidateMode,
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text("Email", style: AppFontStyles.styleSemiBold14),
          ),
          const SizedBox(height: 8),
          UserInput(
            hint: "name@example.com",
            validator: FormValidators.validateEmail,
            onChanged: (value) {
              _email = value;
            },
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Password", style: AppFontStyles.styleSemiBold14),
              Text(
                "Forgot password?",
                style: AppFontStyles.styleMedium12.copyWith(
                  color: kSecTextColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          UserInput(
            hint: "••••••••",
            isPassword: true,
            validator: FormValidators.validatePassword,
            onChanged: (value) {
              _password = value;
            },
          ),
          const SizedBox(height: 16),
          SignInActions(validateForm: _validateForm),
        ],
      ),
    );
  }

  void _validateForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      context.read<AuthCubit>().signIn(email: _email!, password: _password!);
    } else {
      setState(() {
        _autovalidateMode = AutovalidateMode.always;
      });
    }
  }
}

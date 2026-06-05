import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_flow/core/utils/app_font_styles.dart';
import 'package:shop_flow/core/utils/form_validators.dart';
import 'package:shop_flow/core/widget/user_input.dart';
import 'package:shop_flow/features/auth/manager/auth_cubit/auth_cubit.dart';
import 'package:shop_flow/features/auth/view/widgets/sign_up_actions.dart';
import 'package:shop_flow/generated/l10n.dart';

class SignUpInputs extends StatefulWidget {
  const SignUpInputs({super.key});

  @override
  State<SignUpInputs> createState() => _SignUpInputsState();
}

class _SignUpInputsState extends State<SignUpInputs> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  String? _name, _email, _password;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: _autovalidateMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(S.of(context).fullName, style: AppFontStyles.styleSemiBold14),
          const SizedBox(height: 8),
          UserInput(
            hint: S.of(context).fullNameHint,
            validator: FormValidators.requiredFieldValidator,
            onChanged: (value) {
              _name = value;
            },
          ),
          const SizedBox(height: 16),
          Text(S.of(context).email, style: AppFontStyles.styleSemiBold14),
          const SizedBox(height: 8),
          UserInput(
            hint: S.of(context).emailHint,
            validator: FormValidators.validateEmail,
            onChanged: (value) {
              _email = value;
            },
          ),
          const SizedBox(height: 16),
          Text(S.of(context).password, style: AppFontStyles.styleSemiBold14),
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
          SignUpActions(validateForm: _validateForm),
        ],
      ),
    );
  }

  void _validateForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      AuthCubit authCubit = context.read<AuthCubit>();
      authCubit.signUp(email: _email!, password: _password!);
      authCubit.name = _name;
    } else {
      setState(() {
        _autovalidateMode = AutovalidateMode.always;
      });
    }
  }
}

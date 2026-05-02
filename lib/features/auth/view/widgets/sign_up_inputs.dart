import 'package:flutter/material.dart';
import 'package:shop_flow/core/utils/app_font_styles.dart';
import 'package:shop_flow/core/utils/form_validators.dart';
import 'package:shop_flow/core/widget/user_input.dart';
import 'package:shop_flow/features/auth/view/widgets/sign_up_actions.dart';

class SignUpInputs extends StatefulWidget {
  const SignUpInputs({super.key});

  @override
  State<SignUpInputs> createState() => _SignUpInputsState();
}

class _SignUpInputsState extends State<SignUpInputs> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: _autovalidateMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Full Name", style: AppFontStyles.styleSemiBold14),
          const SizedBox(height: 8),
          UserInput(
            hint: "John Doe",
            validator: FormValidators.requiredFieldValidator,
          ),
          const SizedBox(height: 16),
          Text("Email", style: AppFontStyles.styleSemiBold14),
          const SizedBox(height: 8),
          UserInput(
            hint: "name@example.com",
            validator: FormValidators.validateEmail,
          ),
          const SizedBox(height: 16),
          Text("Password", style: AppFontStyles.styleSemiBold14),
          const SizedBox(height: 8),
          UserInput(
            hint: "••••••••",
            isPassword: true,
            validator: FormValidators.validatePassword,
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
    } else {
      setState(() {
        _autovalidateMode = AutovalidateMode.always;
      });
    }
  }
}

import 'package:flutter/material.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/utils/app_font_styles.dart';

class UserInput extends StatefulWidget {
  const UserInput({
    super.key,
    required this.hint,
    this.isPassword = false,
    this.validator,
    this.onChanged,
  });
  final String hint;
  final bool isPassword;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  @override
  State<UserInput> createState() => _UserInputState();
}

class _UserInputState extends State<UserInput> {
  bool showPassword = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: widget.onChanged,
      validator: widget.validator,
      obscureText: widget.isPassword ? showPassword : false,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xffF4F2FC),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 17,
        ),
        hintText: widget.hint,
        hintStyle: AppFontStyles.styleSemiBold16.copyWith(
          color: const Color(0xff6B7280),
        ),

        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    showPassword = !showPassword;
                  });
                },
                icon: Icon(
                  showPassword ? Icons.visibility : Icons.visibility_off,
                ),
              )
            : null,
        border: _buildBorder(color: kPrimaryBorderColor),
        enabledBorder: _buildBorder(color: kPrimaryBorderColor),
        focusedBorder: _buildBorder(color: kFocusColor, width: 2),
        errorBorder: _buildBorder(color: kErrorColor, width: 2),
        focusedErrorBorder: _buildBorder(color: kErrorColor, width: 2),
      ),
    );
  }

  OutlineInputBorder _buildBorder({required Color color, double width = 1}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(kBorderRadiusCircular),
      borderSide: BorderSide(color: color, width: width),
    );
  }
}

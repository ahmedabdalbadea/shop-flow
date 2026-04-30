import 'package:flutter/material.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/utils/app_font_styles.dart';

class UserInput extends StatelessWidget {
  const UserInput({super.key, required this.hint, this.isPassword = false});
  final String hint;
  final bool isPassword;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xffF4F2FC),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 17,
        ),
        hintText: hint,
        hintStyle: AppFontStyles.styleSemiBold16.copyWith(
          color: const Color(0xff6B7280),
        ),
        border: _buildBorder(color: kPrimaryBorderColor),
        focusedBorder: _buildBorder(color: const Color(0xffE0E0E0), width: 2),
        errorBorder: _buildBorder(color: const Color(0xffF44336), width: 2),
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

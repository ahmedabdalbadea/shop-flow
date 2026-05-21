import 'package:flutter/material.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/utils/app_font_styles.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
    this.readOnly = false,
    this.onTap,
    this.onChanged,
    this.onSubmitted,
  });
  final bool readOnly;
  final VoidCallback? onTap;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      child: TextField(
        onChanged: onChanged,
        onTap: onTap,
        onSubmitted: onSubmitted,
        readOnly: readOnly,
        decoration: InputDecoration(
          filled: true,
          fillColor: kFillColor,
          border: _buildBorder(),
          enabledBorder: _buildBorder(),
          focusedBorder: _buildBorder(),
          prefixIcon: Icon(Icons.search),
          hintText: "Search products, brands...",
          hintStyle: AppFontStyles.styleRegular14.copyWith(
            color: kThrTextColor,
          ),
        ),
      ),
    );
  }

  OutlineInputBorder _buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: Colors.transparent),
    );
  }
}

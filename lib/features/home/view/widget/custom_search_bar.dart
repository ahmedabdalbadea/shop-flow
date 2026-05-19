import 'package:flutter/material.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/utils/app_font_styles.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key, this.readOnly = false, this.onTap});
  final bool readOnly;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      child: TextField(
        onTap: onTap,
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

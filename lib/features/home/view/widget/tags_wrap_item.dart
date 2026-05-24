import 'package:flutter/material.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/utils/app_font_styles.dart';

class TagsWrapItem extends StatelessWidget {
  const TagsWrapItem({super.key, required this.tag});
  final String tag;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: kPaddingColor,
        borderRadius: BorderRadius.circular(9999),
      ),
      child: Text(
        tag,
        style: AppFontStyles.styleMedium12.copyWith(color: kThrTextColor),
      ),
    );
  }
}

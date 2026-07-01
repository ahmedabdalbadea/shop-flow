import 'package:flutter/material.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/utils/app_font_styles.dart';

class CheckoutSliverAppBar extends StatelessWidget {
  const CheckoutSliverAppBar({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      surfaceTintColor: Colors.white,
      backgroundColor: Colors.white,
      shadowColor: const Color(0x3AF1F5F9),
      elevation: 4,
      forceElevated: true,
      titleSpacing: 24,
      title: Text(
        title,
        style: AppFontStyles.styleBold20.copyWith(color: kPrimaryColor),
      ),
      actionsPadding: EdgeInsets.only(right: 24),
    );
  }
}

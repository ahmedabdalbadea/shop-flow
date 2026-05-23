import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/utils/app_font_styles.dart';
import 'package:shop_flow/core/utils/assets.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      surfaceTintColor: Colors.white,
      backgroundColor: Colors.white,
      shadowColor: const Color.fromARGB(59, 241, 245, 249),
      elevation: 4,
      forceElevated: true,
      titleSpacing: 24,
      title: Text(
        title,
        style: AppFontStyles.styleBold20.copyWith(color: kPrimaryColor),
      ),
      actionsPadding: EdgeInsets.only(right: 24),
      actions: [SvgPicture.asset(Assets.imageBag)],
    );
  }
}

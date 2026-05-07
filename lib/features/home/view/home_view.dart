import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/utils/app_font_styles.dart';
import 'package:shop_flow/core/utils/assets.dart';
import 'package:shop_flow/features/home/view/widget/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ShopFlow",
          style: AppFontStyles.styleBold20.copyWith(color: kPrimaryColor),
        ),
        actionsPadding: EdgeInsets.only(right: 24),
        actions: [SvgPicture.asset(Assets.imageBag)],
      ),
      body: HomeViewBody(),
    );
  }
}

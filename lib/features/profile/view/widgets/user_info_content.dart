import 'package:flutter/material.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/helpers/formate_name.dart';
import 'package:shop_flow/core/models/user_model.dart';
import 'package:shop_flow/core/utils/app_font_styles.dart';
import 'package:shop_flow/core/utils/assets.dart';

class UserInfoContent extends StatelessWidget {
  const UserInfoContent({super.key, required this.user});
  final UserModel? user;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          clipBehavior: Clip.hardEdge,
          borderRadius: BorderRadiusGeometry.circular(9999),
          child: Image.asset(Assets.userAvatar, width: 120, height: 120),
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(minWidth: 150, maxWidth: 250),
          child: Text(
            formateName(user?.name!)?.join(" ") ?? "Alexandra Rivera",
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: AppFontStyles.styleRegular16,
          ),
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(minWidth: 150, maxWidth: 250),
          child: Text(
            user?.email ?? "alexandra.rivera@example.com",
            maxLines: 2,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: AppFontStyles.styleRegular16.copyWith(color: kThrTextColor),
          ),
        ),
      ],
    );
  }
}

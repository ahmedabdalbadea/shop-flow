import 'package:flutter/material.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/features/profile/view/widgets/profile_item.dart';

class LogOutItem extends StatelessWidget {
  const LogOutItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ProfileItem(
        perfixIcon: Icons.logout,
        title: "Logout",
        textColor: kErrorColor,
        perfixIconColor: kErrorColor,
      ),
    );
  }
}

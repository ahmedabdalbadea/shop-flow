import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/utils/app_router.dart';
import 'package:shop_flow/features/profile/view/widgets/profile_item.dart';

class ProfileItems extends StatelessWidget {
  const ProfileItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              context.push(AppRouter.kOrdersView);
            },
            child: ProfileItem(perfixIcon: Icons.widgets, title: "My Orders"),
          ),
          const Divider(color: kFillColor, indent: 16, endIndent: 16),
          ProfileItem(perfixIcon: Icons.settings, title: "Settings"),
        ],
      ),
    );
  }
}

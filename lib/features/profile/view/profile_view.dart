import 'package:flutter/material.dart';
import 'package:shop_flow/features/profile/view/widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(top: false, child: ProfileViewBody()));
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_flow/core/widget/custom_bottom_navigation_bar.dart';

class MainShell extends StatelessWidget {
  const MainShell({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(top: 8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 10,
              spreadRadius: 2,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: CustomBottomNavigationBar(
          currentIndex: navigationShell.currentIndex,
          onTap: (value) {
            navigationShell.goBranch(value);
          },
        ),
      ),
    );
  }
}

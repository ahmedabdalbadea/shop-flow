import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_flow/core/utils/app_router.dart';
import 'package:shop_flow/core/widget/custom_bottom_navigation_bar.dart';

class MainShell extends StatefulWidget {
  const MainShell({super.key, required this.child});
  final Widget child;

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  final List<String> shellRouters = const [AppRouter.kHomeView];
  @override
  Widget build(BuildContext context) {
    final currentRoute = GoRouterState.of(context).uri.path;

    final calcIndex = shellRouters.indexOf(currentRoute);

    final int currentIndex = calcIndex == -1 ? 0 : calcIndex;
    return Scaffold(
      body: widget.child,
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
          currentIndex: currentIndex,
          onTap: (value) {
            context.go(shellRouters[value]);
          },
        ),
      ),
    );
  }
}

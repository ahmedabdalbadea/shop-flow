import 'package:flutter/material.dart';
import 'package:shop_flow/constants.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    this.onTap,
  });

  final int currentIndex;
  final void Function(int)? onTap;
  final List<({String label, IconData icon, IconData activeIcon})> navItems =
      const [
        (label: 'Home', icon: Icons.home_outlined, activeIcon: Icons.home),
        (
          label: 'Wishlist',
          icon: Icons.favorite_border,
          activeIcon: Icons.favorite,
        ),
        (
          label: 'Cart',
          icon: Icons.shopping_cart_outlined,
          activeIcon: Icons.shopping_cart,
        ),
        (
          label: 'Profile',
          icon: Icons.person_outline,
          activeIcon: Icons.person,
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: kPrimaryColor,
      unselectedItemColor: kThrTextColor,
      onTap: onTap,
      currentIndex: currentIndex,
      items: List.generate(navItems.length, (index) {
        return BottomNavigationBarItem(
          icon: Icon(navItems[index].icon),
          activeIcon: Icon(navItems[index].activeIcon),
          label: navItems[index].label,
        );
      }),
    );
  }
}

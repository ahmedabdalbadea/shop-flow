import 'package:flutter/material.dart';
import 'package:shop_flow/constants.dart';

class OnboardingCard extends StatelessWidget {
  const OnboardingCard({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(kBorderRadiusCircular),
        boxShadow: const [
          BoxShadow(color: Color(0xffF1F5F9), spreadRadius: 5, blurRadius: 6),
        ],
      ),
      child: child,
    );
  }
}

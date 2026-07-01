import 'package:flutter/material.dart';
import 'package:shop_flow/core/utils/app_font_styles.dart';
import 'package:shop_flow/core/widget/onboarding_card.dart';
import 'package:shop_flow/core/widget/user_input.dart';

class ShippingAddressForm extends StatelessWidget {
  const ShippingAddressForm({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingCard(
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Full Name", style: AppFontStyles.styleSemiBold14),
            const SizedBox(height: 8),
            UserInput(hint: "John Doe"),
            const SizedBox(height: 16),

            Text("Phone Number", style: AppFontStyles.styleSemiBold14),
            const SizedBox(height: 8),
            UserInput(hint: "+1 (555) 000-0000"),
            const SizedBox(height: 16),
            Text("Street Address", style: AppFontStyles.styleSemiBold14),
            const SizedBox(height: 8),
            UserInput(hint: "123 Minimalism Avenue"),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("City", style: AppFontStyles.styleSemiBold14),
                      const SizedBox(height: 8),
                      UserInput(hint: "New York"),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("State", style: AppFontStyles.styleSemiBold14),
                      const SizedBox(height: 8),
                      UserInput(hint: "NY"),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

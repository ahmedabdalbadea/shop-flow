import 'package:flutter/material.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/features/home/view/widget/custom_icon_elevated_button.dart';

class PayNowButton extends StatelessWidget {
  const PayNowButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(24, 16, 24, 32),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            offset: Offset(0, 4),
            blurRadius: 16,
          ),
        ],
      ),
      child: SizedBox(
        height: 56,
        child: CustomIconElevatedButton(
          label: "Pay Now",
          icon: Icons.arrow_forward,
          backgroundColor: kPrimaryColor,
          foregroundColor: Colors.white,
          iconAlignment: IconAlignment.end,
          onPressed: () {},
        ),
      ),
    );
  }
}

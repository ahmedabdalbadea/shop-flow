import 'package:flutter/material.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/utils/app_font_styles.dart';

class StripeSecurityNotice extends StatelessWidget {
  const StripeSecurityNotice({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xffDEE0FF),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.lock_rounded, color: kSecTextColor),
          const SizedBox(width: 12),
          SizedBox(
            width: MediaQuery.widthOf(context) * 0.7,
            child: Text(
              "Secure encrypted payment via ShopFlow Stripe Gateway.",
              style: AppFontStyles.styleMedium12.copyWith(
                color: const Color(0xff293CA0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

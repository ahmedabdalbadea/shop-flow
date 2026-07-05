import 'package:flutter/material.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/features/profile/view/widgets/order_footer.dart';
import 'package:shop_flow/features/profile/view/widgets/order_header.dart';
import 'package:shop_flow/features/profile/view/widgets/order_product.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 6, bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xffF8FAFC)),
        boxShadow: [
          const BoxShadow(
            color: Color(0x073F51B5),
            offset: Offset(0, 4),
            blurRadius: 20,
          ),
        ],
      ),
      child: const Column(
        children: [
          OrderHeader(),
          SizedBox(height: 8),
          OrderProduct(),
          Divider(height: 24, color: kFillColor),
          OrderFooter(),
        ],
      ),
    );
  }
}

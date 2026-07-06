import 'package:flutter/material.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/widget/product_image.dart';

class OrderSkeletonItem extends StatelessWidget {
  const OrderSkeletonItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: const Text('#SF-00000'),
            subtitle: const Text('Jul 0, 2026'),

            trailing: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xffF0FDF4),
                border: Border.all(color: const Color(0xffDCFCE7)),
                borderRadius: BorderRadius.circular(9999),
              ),
              child: const Text('PreProccssing'),
            ),
          ),
          const SizedBox(height: 16),

          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: kFillColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                SizedBox(
                  height: 64,
                  width: 64,
                  child: ProductImage(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    image: "",
                  ),
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Product Title Placeholder',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 6),
                      Text('Qty: 0'),
                    ],
                  ),
                ),
                const Text('\$00.00'),
              ],
            ),
          ),
          const SizedBox(height: 16),

          const Row(children: [Text('Total Amount: '), Text('\$000.00')]),
        ],
      ),
    );
  }
}

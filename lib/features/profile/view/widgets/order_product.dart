import 'package:flutter/material.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/utils/app_font_styles.dart';
import 'package:shop_flow/core/widget/product_image.dart';

class OrderProduct extends StatelessWidget {
  const OrderProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: kFillColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 64,
            child: ProductImage(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              image:
                  "https://images.squarespace-cdn.com/content/v1/62957e003c63212b17de5749/cb3406ee-bb0d-418c-9ba1-4f182180ef2a/Sennheiser-Product-Gel0018.jpg",
            ),
          ),

          Expanded(
            child: ListTile(
              title: Text(
                "Velocity Elite Runners",
                maxLines: 2,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: AppFontStyles.styleRegular16,
              ),

              subtitle: Text(
                "Qty: 2",
                style: AppFontStyles.styleRegular16.copyWith(
                  color: kThrTextColor,
                ),
              ),
              trailing: Text("\$129.00", style: AppFontStyles.styleBold16),
              // isThreeLine: true,
            ),
          ),
        ],
      ),
    );
  }
}

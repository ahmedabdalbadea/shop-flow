import 'package:flutter/material.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/utils/app_font_styles.dart';
import 'package:shop_flow/core/widget/product_image.dart';
import 'package:shop_flow/features/cart/data/models/product_cart_model.dart';

class OrderProduct extends StatelessWidget {
  const OrderProduct({super.key, required this.product});
  final ProductCartModel product;
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
              image: product.image,
            ),
          ),

          Expanded(
            child: ListTile(
              title: Text(
                product.title,
                maxLines: 2,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: AppFontStyles.styleRegular16,
              ),

              subtitle: Text(
                "Qty: ${product.count}",
                style: AppFontStyles.styleRegular16.copyWith(
                  color: kThrTextColor,
                ),
              ),
              trailing: Text(
                "\$${product.price.toStringAsFixed(2)}",
                style: AppFontStyles.styleBold16,
              ),
              // isThreeLine: true,
            ),
          ),
        ],
      ),
    );
  }
}

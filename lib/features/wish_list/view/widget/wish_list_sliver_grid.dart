import 'package:flutter/material.dart';
import 'package:shop_flow/core/models/products/product.dart';
import 'package:shop_flow/features/wish_list/view/widget/delete_icon_button.dart';
import 'package:shop_flow/features/wish_list/view/widget/wish_list_product.dart';

class WishListSliverGrid extends StatefulWidget {
  const WishListSliverGrid({super.key, required this.products});
  final List<Product> products;

  @override
  State<WishListSliverGrid> createState() => _WishListSliverGridState();
}

class _WishListSliverGridState extends State<WishListSliverGrid> {
  bool appearDelete = false;
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1 / 1.21,
      ),
      delegate: SliverChildBuilderDelegate(childCount: widget.products.length, (
        context,
        index,
      ) {
        return GestureDetector(
          onDoubleTap: () {
            setState(() {
              appearDelete = !appearDelete;
            });
          },
          child: Stack(
            children: [
              WishListProduct(product: widget.products[index]),
              appearDelete
                  ? Positioned(
                      top: 8,
                      left: 8,
                      child: DeleteIconButton(product: widget.products[index]),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        );
      }),
    );
  }
}

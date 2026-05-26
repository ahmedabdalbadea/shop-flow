import 'package:flutter/material.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/utils/app_font_styles.dart';
import 'package:shop_flow/core/widget/custom_elevated_button.dart';
import 'package:shop_flow/features/home/data/models/products/product.dart';
import 'package:shop_flow/features/home/view/widget/custom_icon_elevated_button.dart';
import 'package:shop_flow/features/home/view/widget/custom_sliver_app_bar.dart';
import 'package:shop_flow/features/home/view/widget/product_details_card.dart';
import 'package:shop_flow/features/home/view/widget/product_image.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      scrollBehavior: ScrollBehavior().copyWith(
        physics: BouncingScrollPhysics(),
        overscroll: false,
      ),
      slivers: [
        CustomSliverAppBar(title: "Shop Flow"),
        SliverToBoxAdapter(child: ProductImage(image: product.thumbnail)),

        SliverPadding(
          padding: const EdgeInsetsGeometry.fromLTRB(24, 0, 24, 24),
          sliver: SliverToBoxAdapter(
            child: ProductDetailsCard(product: product),
          ),
        ),

        SliverToBoxAdapter(
          child: Container(
            padding: EdgeInsets.fromLTRB(24, 16, 24, 32),
            color: Colors.white,
            child: SizedBox(
              height: 56,
              child: CustomIconElevatedButton(
                label: "Add to Cart",
                icon: Icons.shopping_cart_outlined,
                backgroundColor: kPrimaryColor,
                foregroundColor: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

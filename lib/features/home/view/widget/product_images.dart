import 'package:flutter/material.dart';
import 'package:shop_flow/features/home/view/widget/dot_indicators.dart';
import 'package:shop_flow/features/home/view/widget/product_image.dart';

class ProductImages extends StatefulWidget {
  const ProductImages({
    super.key,
    required this.images,
    required this.productId,
  });

  final List<dynamic> images;
  final int productId;
  @override
  State<ProductImages> createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  int imageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 250,
          child: PageView.builder(
            onPageChanged: (value) {
              setState(() {
                imageIndex = value;
              });
            },
            scrollDirection: Axis.horizontal,
            itemCount: widget.images.length,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Hero(
                  tag: "${widget.productId}",
                  child: ProductImage(image: widget.images[index]),
                );
              }

              return ProductImage(image: widget.images[index]);
            },
          ),
        ),
        const SizedBox(height: 16),
        DotIndicators(
          indicatorsCount: widget.images.length,
          imageIndex: imageIndex,
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

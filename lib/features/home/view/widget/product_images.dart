import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:shop_flow/features/home/view/widget/dot_indicators.dart';
import 'package:shop_flow/features/home/view/widget/product_image.dart';

class ProductImages extends StatefulWidget {
  const ProductImages({super.key, required this.images});

  final List<dynamic> images;

  @override
  State<ProductImages> createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  int imageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExpandablePageView.builder(
          estimatedPageSize: 300,
          onPageChanged: (value) {
            setState(() {
              imageIndex = value;
            });
          },
          scrollDirection: Axis.horizontal,
          itemCount: widget.images.length,
          itemBuilder: (context, index) {
            return ProductImage(image: widget.images[index]);
          },
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

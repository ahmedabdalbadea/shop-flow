import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shop_flow/core/utils/assets.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({super.key, this.image, this.borderRadius});
  final BorderRadiusGeometry? borderRadius;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius:
          borderRadius ??
          BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
      child: CachedNetworkImage(
        imageUrl: image ?? "",
        fit: BoxFit.contain,
        errorWidget: (context, url, error) {
          return Image.asset(
            width: double.infinity,
            Assets.imageNotFound,
            fit: BoxFit.contain,
          );
        },
      ),
    );
  }
}

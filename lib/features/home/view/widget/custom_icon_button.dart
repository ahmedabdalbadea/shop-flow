import 'package:flutter/material.dart';
import 'package:shop_flow/constants.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.onPressed,
    this.radius,
    this.size,
  });
  final VoidCallback onPressed;
  final double? radius, size;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: IconButton.styleFrom(
        backgroundColor: kPrimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 8),
        ),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: Size(size ?? 32, size ?? 32),
      ),
      onPressed: onPressed,
      icon: Icon(Icons.add, color: Colors.white, size: 11.67),
    );
  }
}

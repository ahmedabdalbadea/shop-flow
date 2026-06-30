import 'package:flutter/material.dart';

class CartIconButton extends StatelessWidget {
  const CartIconButton({
    super.key,
    required this.icon,
    this.iconColor,
    this.backgroundColor,
    this.onPressed,
    this.iconSize,
    this.minimumSize,
    this.padding,
  });
  final IconData icon;
  final Color? iconColor, backgroundColor;
  final VoidCallback? onPressed;
  final double? iconSize, minimumSize;
  final EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: IconButton.styleFrom(
        padding: padding,
        backgroundColor: backgroundColor,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: Size(minimumSize ?? 32, minimumSize ?? 32),
      ),
      onPressed: onPressed,
      icon: Icon(icon, color: iconColor, size: iconSize ?? 16),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shop_flow/constants.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({super.key, required this.onPressed});
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: IconButton.styleFrom(
        backgroundColor: kPrimaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: Size(32, 32),
      ),
      onPressed: onPressed,
      icon: Icon(Icons.add, color: Colors.white, size: 11.67),
    );
  }
}

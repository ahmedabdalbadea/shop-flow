import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/manager/cubit/wish_list_cubit/wish_list_cubit.dart';
import 'package:shop_flow/core/manager/provider/user_provider.dart';
import 'package:shop_flow/core/models/products/product.dart';

class DeleteIconButton extends StatelessWidget {
  const DeleteIconButton({super.key, required this.product});

  final Product product;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: IconButton.styleFrom(
        backgroundColor: kErrorColor,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: Size(24, 24),
      ),
      onPressed: () {
        context.read<WishListCubit>().deleteFromWishList(
          uId: Provider.of<UserProvider>(context, listen: false).user!.uId,
          product: product,
        );
      },
      icon: Icon(Icons.delete_outline),
      color: Colors.white,
      iconSize: 24,
    );
  }
}

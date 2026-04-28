import 'package:flutter/material.dart';
import 'package:shop_flow/core/utlis/app_router.dart';

void main() {
  runApp(const ShopFlow());
}

class ShopFlow extends StatelessWidget {
  const ShopFlow({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
    );
  }
}

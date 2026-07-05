import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_flow/core/manager/cubit/order_cubit/order_cubit.dart';
import 'package:shop_flow/core/utils/service_locator.dart';
import 'package:shop_flow/features/cart/view/widget/payment_view_body.dart';
import 'package:shop_flow/features/profile/data/repos/profile_repo.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => OrderCubit(getIt.get<ProfileRepo>()),
        child: const PaymentViewBody(),
      ),
    );
  }
}

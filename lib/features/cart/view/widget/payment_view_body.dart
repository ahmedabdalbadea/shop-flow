import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/helpers/show_snack_bar.dart';
import 'package:shop_flow/core/manager/cubit/cart_cubit/cart_cubit.dart';
import 'package:shop_flow/core/manager/cubit/order_cubit/order_cubit.dart';
import 'package:shop_flow/core/manager/provider/user_provider.dart';
import 'package:shop_flow/core/utils/app_router.dart';
import 'package:shop_flow/core/widget/custom_elevated_button.dart';
import 'package:shop_flow/features/cart/view/widget/secondary_sliver_app_bar.dart';
import 'package:shop_flow/features/cart/view/widget/select_payment_method.dart';
import 'package:shop_flow/features/cart/view/widget/total_to_pay.dart';

class PaymentViewBody extends StatelessWidget {
  const PaymentViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderCubit, OrderState>(
      listener: (context, state) {
        if (state is OrderAddingSuccess) {
          context.go(AppRouter.kOrdersView);
        } else if (state is OrderAddingFailure) {
          showSnackbar(
            context,
            title: state.errMsg,
            backgroundColor: kErrorColor,
            textColor: Colors.white,
          );
        }
      },
      builder: (context, state) {
        final double totalAmount = context
            .read<CartCubit>()
            .calcTotalPriceWithTax();
        return BlurryModalProgressHUD(
          inAsyncCall: state is OrderAddingLoading ? true : false,
          blurEffectIntensity: 2,
          dismissible: false,
          opacity: 0.4,
          child: CustomScrollView(
            physics: const ClampingScrollPhysics(),
            slivers: [
              const SecondarySliverAppBar(title: "Payment"),
              const SliverToBoxAdapter(child: SizedBox(height: 24)),

              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: TotalToPay(totalAmount: totalAmount),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 24)),

              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: SelectPaymentMethod(),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 24)),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: SizedBox(
                    height: 56,
                    child: CustomElevatedButton(
                      title: "Pay Now",
                      backgroundColor: kPrimaryColor,
                      foregroundColor: Colors.white,
                      onPressed: () {
                        context.read<OrderCubit>().createOrder(
                          uId: Provider.of<UserProvider>(
                            context,
                            listen: false,
                          ).user!.uId,
                          totalAmount: totalAmount,
                          products: context.read<CartCubit>().products,
                        );

                        context.read<CartCubit>().clearCart();
                      },
                    ),
                  ),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 24)),
            ],
          ),
        );
      },
    );
  }
}

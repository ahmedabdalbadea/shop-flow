import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_flow/core/manager/cubit/order_cubit/order_cubit.dart';
import 'package:shop_flow/core/utils/app_font_styles.dart';
import 'package:shop_flow/features/cart/view/widget/payment_method_item.dart';

class SelectPaymentMethod extends StatefulWidget {
  const SelectPaymentMethod({super.key});

  @override
  State<SelectPaymentMethod> createState() => _SelectPaymentMethodState();
}

class _SelectPaymentMethodState extends State<SelectPaymentMethod> {
  final List<({IconData icon, String title})> paymentMethods = const [
    (icon: Icons.apps_rounded, title: 'Apple Pay'),
    (icon: Icons.credit_card_rounded, title: 'Credit / Debit Card'),
    (icon: Icons.g_mobiledata_rounded, title: 'Google Pay'),
  ];
  int selectedItem = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Select Payment Method",
            style: AppFontStyles.styleSemiBold20,
          ),
        ),
        const SizedBox(height: 8),
        ...List.generate(3, (index) {
          return Padding(
            padding: const EdgeInsets.only(top: 12),
            child: GestureDetector(
              onTap: () {
                if (selectedItem != index) {
                  setState(() {
                    selectedItem = index;
                  });

                  context.read<OrderCubit>().paymentMethod =
                      paymentMethods[index].title;
                }
              },
              child: PaymentMethodItem(
                perfixIcon: paymentMethods[index].icon,
                title: paymentMethods[index].title,
                isSelected: index == selectedItem,
              ),
            ),
          );
        }),
      ],
    );
  }
}

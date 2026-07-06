import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shop_flow/core/models/order_model.dart';
import 'package:shop_flow/core/utils/app_font_styles.dart';

class OrderHeader extends StatelessWidget {
  const OrderHeader({super.key, required this.order});
  final OrderModel order;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(order.orderId, style: AppFontStyles.styleRegular16),
      subtitle: Text(
        DateFormat.yMMMd().format(order.time.toDate()),
        style: AppFontStyles.styleSemiBold16,
      ),

      trailing: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(
          color: _getStatusBgColor(order.orderState),
          border: Border.all(color: const Color(0xffDCFCE7)),
          borderRadius: BorderRadius.circular(9999),
        ),
        child: Text(
          order.orderState,
          style: AppFontStyles.styleBold16.copyWith(
            color: _getStatusTextColor(order.orderState),
          ),
        ),
      ),
    );
  }

  Color _getStatusBgColor(String state) {
    switch (state.toLowerCase()) {
      case 'delivered':
        return const Color(0xffEBF7EE);
      case 'processing':
        return const Color(0xffEEF2FF);
      case 'cancelled':
        return const Color(0xffF1F5F9);
      default:
        return const Color(0xffF8FAFC);
    }
  }

  Color _getStatusTextColor(String state) {
    switch (state.toLowerCase()) {
      case 'delivered':
        return const Color(0xff34A853);
      case 'processing':
        return const Color(0xff4F46E5);
      case 'cancelled':
        return const Color(0xff64748B);
      default:
        return const Color(0xff000000);
    }
  }
}

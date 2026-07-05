import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shop_flow/features/cart/data/models/product_cart_model.dart';

class OrderModel {
  final String orderId;
  final Timestamp time;
  final double totalAmount;
  final List<ProductCartModel> products;
  final String orderState;
  final String paymentMethod;
  OrderModel({
    required this.orderId,
    required this.time,
    required this.totalAmount,
    required this.products,
    required this.orderState,
    required this.paymentMethod,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      orderId: json['orderId'],
      time: json['time'],
      totalAmount: json['totalAmount'],
      products: (json['products'] as List<dynamic>)
          .map((e) => ProductCartModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      orderState: json['orderState'],
      paymentMethod: json['paymentMethod'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'orderId': orderId,
      'time': time,
      'totalAmount': totalAmount,
      'products': products.map((e) => e.toJson()).toList(),
      'orderState': orderState,
      "paymentMethod": paymentMethod,
    };
  }
}

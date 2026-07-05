import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/models/order_model.dart';

class ProfileRemoteDataSource {
  final FirebaseFirestore _firestore;

  ProfileRemoteDataSource(this._firestore);

  Future<void> createOrder({
    required String uId,
    required OrderModel order,
  }) async {
    final String uniqueDocId = "$uId-${order.orderId}";
    return await _firestore.collection(kOrdersCollection).doc(uniqueDocId).set({
      "uId": uId,
      ...order.toJson(),
    });
  }
}

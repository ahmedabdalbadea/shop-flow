import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/models/products/product.dart';
import 'package:shop_flow/core/models/products/products.dart';

class WishListRemoteDataSource {
  final FirebaseFirestore _firestore;
  WishListRemoteDataSource(this._firestore);

  Future<void> addProductToWishList({
    required String uId,
    required Product product,
  }) async {
    final String uniqueDocId = '${uId}_${product.id}';
    await _firestore
        .collection(kWishListProductCollection)
        .doc(uniqueDocId)
        .set({'uId': uId, ...product.toJson()});
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getWishListProducts({
    required String uId,
  }) {
    return _firestore
        .collection(kWishListProductCollection)
        .where('uId', isEqualTo: uId)
        .snapshots();
  }
}

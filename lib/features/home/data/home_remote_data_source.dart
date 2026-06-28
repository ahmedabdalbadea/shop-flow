import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shop_flow/constants.dart';

class HomeRemoteDataSource {
  final FirebaseFirestore _firestore;
  HomeRemoteDataSource(this._firestore);

  Future<Map<String, dynamic>?> getUserData({required String uId}) async {
    final documentSnapshot = await _firestore
        .collection(kUsersCollection)
        .doc(uId)
        .get();

    return documentSnapshot.data();
  }
}

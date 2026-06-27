import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/features/auth/data/models/user_model.dart';

class AuthRemoteDataSource {
  final FirebaseAuth _auth;

  final FirebaseFirestore _firestore;

  AuthRemoteDataSource(this._auth, this._firestore);

  Future<UserCredential> signUp(String email, String password) async {
    return await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<UserCredential?> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignIn googleSignIn = GoogleSignIn.instance;
    await googleSignIn.initialize(
      clientId:
          "524858853482-99m6n6mmhm7efrfh66rcbpvpl1do03pa.apps.googleusercontent.com",
    );
    final GoogleSignInAccount googleUser = await googleSignIn.authenticate();
    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = googleUser.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await _auth.signInWithCredential(credential);
  }

  Future<UserCredential> signIn(String email, String password) async {
    return await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> addUserToCollection({
    required String uId,
    required String name,
    required String email,
  }) async {
    UserModel user = UserModel(uId: uId, name: name, email: email);
    return await _firestore
        .collection(kUsersCollection)
        .doc(uId)
        .set(user.toJson());
  }
}

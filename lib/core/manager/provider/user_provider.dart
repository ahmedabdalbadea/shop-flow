import 'package:shop_flow/features/auth/data/models/user_model.dart';

class UserProvider {
  UserModel? _user;

  UserModel? get user => _user;

  set user(UserModel value) {
    _user = value;
  }
}

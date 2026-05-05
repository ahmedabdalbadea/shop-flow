import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop_flow/features/auth/data/models/user_model.dart';

import 'package:shop_flow/features/auth/data/repos/auth_repo_impl.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authRepoImpl) : super(AuthInitial());
  final AuthRepoImpl _authRepoImpl;
  Future<void> signUp({required String email, required String password}) async {
    emit(SignUpLoading());
    var result = await _authRepoImpl.signUp(email: email, password: password);

    result.fold(
      (failure) {
        emit(SignUpFailure(failure.errMsg));
      },
      (user) {
        emit(SignUpSuccess(user: user));
      },
    );
  }
}

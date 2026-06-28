import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop_flow/features/auth/data/models/user_model.dart';
import 'package:shop_flow/features/auth/data/repos/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authRepo) : super(AuthInitial());
  final AuthRepo _authRepo;
  UserModel? user;
  Future<void> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(SignUpLoading());
    var result = await _authRepo.signUp(
      name: name,
      email: email,
      password: password,
    );

    result.fold(
      (failure) {
        emit(SignUpFailure(failure.errMsg));
      },
      (user) {
        this.user = user;
        emit(SignUpSuccess(user: user));
      },
    );
  }

  Future<void> signIn({required String email, required String password}) async {
    emit(SignInLoading());
    var result = await _authRepo.signIn(email: email, password: password);

    result.fold(
      (failure) {
        emit(SignInFailure(failure.errMsg));
      },
      (user) {
        this.user = user;
        emit(SignInSuccess(user: user));
      },
    );
  }

  Future<void> signInWithGoogle() async {
    var result = await _authRepo.signInWithGoogle();

    result.fold(
      (failure) {
        emit(GoogleSignInFailure(failure.errMsg));
      },
      (user) {
        this.user = user;
        emit(GoogleSignInSuccess(user: user));
      },
    );
  }
}

import 'package:go_router/go_router.dart';
import 'package:shop_flow/features/auth/view/sign_in_view.dart';
import 'package:shop_flow/features/splash/view/splash_view.dart';

abstract class AppRouter {
  static const kSignInView = "/signInView";
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          return const SplashView();
        },
      ),

      GoRoute(
        path: kSignInView,
        builder: (context, state) {
          return const SignInView();
        },
      ),
    ],
  );
}

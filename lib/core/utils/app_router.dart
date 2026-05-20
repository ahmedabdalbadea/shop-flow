import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_flow/features/auth/view/sign_in_view.dart';
import 'package:shop_flow/features/auth/view/sign_up_view.dart';
import 'package:shop_flow/features/home/manager/category_list_cubit/category_list_cubit.dart';
import 'package:shop_flow/features/home/view/home_view.dart';
import 'package:shop_flow/features/home/view/search_view.dart';
import 'package:shop_flow/features/splash/view/splash_view.dart';

abstract class AppRouter {
  static const kSignInView = "/signInView";
  static const kSignUpView = "/signUpView";
  static const kHomeView = "/homeView";
  static const kSearchView = "/searchView";
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

      GoRoute(
        path: kSignUpView,
        builder: (context, state) {
          return const SignUpView();
        },
      ),

      GoRoute(
        path: kHomeView,
        builder: (context, state) {
          return const HomeView();
        },
      ),

      GoRoute(
        path: kSearchView,
        builder: (context, state) {
          CategoryListCubit cubit = state.extra as CategoryListCubit;
          return BlocProvider.value(value: cubit, child: const SearchView());
        },
      ),
    ],
  );
}

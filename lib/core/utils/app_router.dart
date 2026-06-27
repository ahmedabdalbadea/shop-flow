import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_flow/core/widget/main_shell.dart';
import 'package:shop_flow/features/auth/view/sign_in_view.dart';
import 'package:shop_flow/features/auth/view/sign_up_view.dart';
import 'package:shop_flow/features/home/data/models/products/product.dart';
import 'package:shop_flow/features/home/manager/all_products_cubit.dart/all_products_cubit.dart';
import 'package:shop_flow/features/home/manager/category_list_cubit/category_list_cubit.dart';
import 'package:shop_flow/features/home/view/all_products_view.dart';
import 'package:shop_flow/features/home/view/home_view.dart';
import 'package:shop_flow/features/home/view/product_details_view.dart';
import 'package:shop_flow/features/home/view/search_view.dart';
import 'package:shop_flow/features/splash/view/splash_view.dart';

abstract class AppRouter {
  static const kSignInView = "/signInView";
  static const kSignUpView = "/signUpView";
  static const kHomeView = "/homeView";
  static const kSearchView = "/searchView";
  static const kAllProductsView = "/allProductsView";
  static const kProductDetailsView = "/productDetailsView";
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
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const SignInView(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity: CurvedAnimation(
                      parent: animation,
                      curve: Curves.easeIn,
                    ),
                    child: child,
                  );
                },
            transitionDuration: const Duration(milliseconds: 450),
          );
        },
      ),

      GoRoute(
        path: kSignUpView,
        builder: (context, state) {
          return const SignUpView();
        },
      ),
      ShellRoute(
        builder: (context, state, child) {
          return MainShell(child: child);
        },
        routes: [
          GoRoute(
            path: kHomeView,
            builder: (context, state) {
              final String? name = state.extra as String?;
              return HomeView(name: name);
            },
          ),
        ],
      ),

      GoRoute(
        path: kSearchView,
        builder: (context, state) {
          CategoryListCubit cubit = state.extra as CategoryListCubit;
          return BlocProvider.value(value: cubit, child: const SearchView());
        },
      ),

      GoRoute(
        path: kAllProductsView,
        builder: (context, state) {
          final AllProductsCubit cubit = state.extra as AllProductsCubit;
          return BlocProvider.value(
            value: cubit,
            child: const AllProductsView(),
          );
        },
      ),

      GoRoute(
        path: kProductDetailsView,
        builder: (context, state) {
          final Product product = state.extra as Product;
          return ProductDetailsView(product: product);
        },
      ),
    ],
  );
}

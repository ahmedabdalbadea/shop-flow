part of 'search_products_cubit.dart';

@immutable
sealed class SearchProductsState {}

final class SearchProductsInitial extends SearchProductsState {}

final class SearchProductsLoading extends SearchProductsState {}

final class SearchProductsSuccess extends SearchProductsState {}

final class SearchProductsFailure extends SearchProductsState {
  final String errMsg;

  SearchProductsFailure({required this.errMsg});
}

final class SearchProductsByCategoryLoading extends SearchProductsState {}

final class SearchProductsByCategorySuccess extends SearchProductsState {}

final class SearchProductsByCategoryFailure extends SearchProductsState {
  final String errMsg;

  SearchProductsByCategoryFailure({required this.errMsg});
}

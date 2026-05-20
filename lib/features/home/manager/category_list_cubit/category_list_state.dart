part of 'category_list_cubit.dart';

@immutable
sealed class CategoryListState {}

final class CategoryListInitial extends CategoryListState {}

final class CategoryListLoading extends CategoryListState {}

final class CategoryListSuccess extends CategoryListState {}

final class CategoryListFailure extends CategoryListState {
  final String errMsg;

  CategoryListFailure({required this.errMsg});
}

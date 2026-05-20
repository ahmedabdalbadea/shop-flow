import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:shop_flow/features/home/data/repos/home_repo.dart';

part 'category_list_state.dart';

class CategoryListCubit extends Cubit<CategoryListState> {
  CategoryListCubit(this._homeRepo) : super(CategoryListInitial());

  final HomeRepo _homeRepo;

  List<dynamic>? categoreyList;
  Future<void> getCategoreyList() async {
    emit(CategoryListLoading());
    var data = await _homeRepo.fetchCategoryList();

    data.fold(
      (failure) {
        emit(CategoryListFailure(errMsg: failure.errMsg));
      },
      (categories) {
        categoreyList = categories;
        emit(CategoryListSuccess());
      },
    );
  }
}

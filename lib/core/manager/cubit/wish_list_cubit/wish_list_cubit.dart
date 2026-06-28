import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'wish_list_state.dart';

class WishListCubit extends Cubit<WishListState> {
  WishListCubit() : super(WishListInitial());
}

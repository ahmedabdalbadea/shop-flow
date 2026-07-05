import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:shop_flow/core/models/order_model.dart';
import 'package:shop_flow/features/profile/data/repos/profile_repo.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit(this._profileRepo) : super(OrderInitial());
  final ProfileRepo _profileRepo;
}

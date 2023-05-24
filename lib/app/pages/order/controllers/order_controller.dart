import 'package:bloc/bloc.dart';
import 'package:vakinha_burger_bloc/app/dto/order_product_dto.dart';
import 'package:vakinha_burger_bloc/app/pages/order/controllers/order_state.dart';

class OrderController extends Cubit<OrderState> {
  OrderController() : super(const OrderState.initial());

  void load(List<OrderProductDTO> products) {
    emit(state.copyWith(orderProducts: products));
  }
}

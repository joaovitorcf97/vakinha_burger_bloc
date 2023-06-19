import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:vakinha_burger_bloc/app/dto/order_product_dto.dart';
import 'package:vakinha_burger_bloc/app/pages/order/controllers/order_state.dart';
import 'package:vakinha_burger_bloc/app/repositories/order/order_repository.dart';

class OrderController extends Cubit<OrderState> {
  final OrderRepository _orderRepository;

  OrderController(this._orderRepository) : super(const OrderState.initial());

  Future<void> load(List<OrderProductDTO> products) async {
    try {
      emit(state.copyWith(status: OrderStatus.loading));

      final paymentTypes = await _orderRepository.getAllPaymentsTypes();

      emit(state.copyWith(
        orderProducts: products,
        status: OrderStatus.loaded,
        paymentTypes: paymentTypes,
      ));
    } catch (e, s) {
      log('Erro ao carregar pagina', error: e, stackTrace: s);
      emit(state.copyWith(
        status: OrderStatus.error,
        errorMessage: 'Erro ao carregar a página',
      ));
    }
  }
}

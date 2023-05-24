import 'package:equatable/equatable.dart';
import 'package:match/match.dart';

import 'package:vakinha_burger_bloc/app/dto/order_product_dto.dart';

part 'order_state.g.dart';

@match
enum OrderStatus {
  initial,
  loaded,
}

class OrderState extends Equatable {
  final OrderStatus status;
  final List<OrderProductDTO> orderProducts;

  const OrderState({
    required this.status,
    required this.orderProducts,
  });

  const OrderState.initial()
      : status = OrderStatus.initial,
        orderProducts = const [];

  @override
  List<Object?> get props => [status, orderProducts];

  OrderState copyWith({
    OrderStatus? status,
    List<OrderProductDTO>? orderProducts,
  }) {
    return OrderState(
      status: status ?? this.status,
      orderProducts: orderProducts ?? this.orderProducts,
    );
  }
}

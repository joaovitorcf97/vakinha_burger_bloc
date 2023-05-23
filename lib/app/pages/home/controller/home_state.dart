import 'package:equatable/equatable.dart';
import 'package:match/match.dart';

import 'package:vakinha_burger_bloc/app/dto/order_product_dto.dart';
import 'package:vakinha_burger_bloc/app/models/product_model.dart';

part 'home_state.g.dart';

@match
enum HomeStateStatus {
  initial,
  loading,
  loaded,
  error,
}

class HomeState extends Equatable {
  final HomeStateStatus status;
  final List<ProductModel> products;
  final String? errorMessage;
  final List<OrderProductDTO> shopInBag;

  const HomeState({
    required this.status,
    required this.products,
    required this.shopInBag,
    this.errorMessage,
  });

  const HomeState.initial()
      : status = HomeStateStatus.initial,
        products = const [],
        shopInBag = const [],
        errorMessage = null;

  @override
  List<Object?> get props => [
        status,
        products,
        errorMessage,
        shopInBag,
      ];

  HomeState copyWith({
    HomeStateStatus? status,
    List<ProductModel>? products,
    String? errorMessage,
    List<OrderProductDTO>? shopInBag,
  }) {
    return HomeState(
      status: status ?? this.status,
      products: products ?? this.products,
      errorMessage: errorMessage ?? this.errorMessage,
      shopInBag: shopInBag ?? this.shopInBag,
    );
  }
}

import 'package:vakinha_burger_bloc/app/models/product_model.dart';

class OrderProductDTO {
  final ProductModel product;
  final int amount;

  OrderProductDTO({
    required this.product,
    required this.amount,
  });

  double get totalAmount => amount * product.price;

  OrderProductDTO copyWith({
    ProductModel? product,
    int? amount,
  }) {
    return OrderProductDTO(
      product: product ?? this.product,
      amount: amount ?? this.amount,
    );
  }
}

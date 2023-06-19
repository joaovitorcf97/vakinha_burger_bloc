import 'package:vakinha_burger_bloc/app/dto/order_product_dto.dart';

class OrderDTO {
  List<OrderProductDTO> products;
  String address;
  String document;
  int paymentMethodId;

  OrderDTO({
    required this.products,
    required this.address,
    required this.document,
    required this.paymentMethodId,
  });
}

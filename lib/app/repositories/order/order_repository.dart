import 'package:vakinha_burger_bloc/app/dto/order_dto.dart';

import '../../models/payment_type_model.dart';

abstract class OrderRepository {
  Future<List<PaymentTypeModel>> getAllPaymentsTypes();
  Future<void> saveOrder(OrderDTO order);
}

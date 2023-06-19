import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:vakinha_burger_bloc/app/core/exceptions/repository_exceptions.dart';
import 'package:vakinha_burger_bloc/app/core/rest_client/custom_dio.dart';
import 'package:vakinha_burger_bloc/app/dto/order_dto.dart';
import 'package:vakinha_burger_bloc/app/models/payment_type_model.dart';
import 'package:vakinha_burger_bloc/app/repositories/order/order_repository.dart';

class OrderRepositoryImpl implements OrderRepository {
  final CustomDio dio;

  OrderRepositoryImpl({
    required this.dio,
  });

  @override
  Future<List<PaymentTypeModel>> getAllPaymentsTypes() async {
    try {
      final result = await dio.auth().get('/payment-types');
      return result.data
          .map<PaymentTypeModel>((p) => PaymentTypeModel.fromMap(p))
          .toList();
    } on DioError catch (e, s) {
      log('Erro ao buscar formas de pagamentos', error: e, stackTrace: s);
      throw RepositoryExceptions(
        message: 'Erro ao buscar formas de pagamentos',
      );
    }
  }

  @override
  Future<void> saveOrder(OrderDTO order) async {
    try {
      await dio.auth().post('/orders', data: {
        'products': order.products
            .map((e) => {
                  'id': e.product.id,
                  'amount': e.amount,
                  'total_price': e.totalAmount,
                })
            .toList(),
        'user_id': '#userAuthRef',
        'address': order.address,
        'CPF': order.document,
        'payment_method_id': order.paymentMethodId,
      });
    } on DioError catch (e, s) {
      log('Erro ao realizar pedido', error: e, stackTrace: s);
      throw RepositoryExceptions(message: 'Erro ao realizar pedido');
    }
  }
}

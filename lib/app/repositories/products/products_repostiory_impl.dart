import 'dart:developer';

import 'package:dio/dio.dart';

import '../../core/exceptions/repository_exceptions.dart';
import '../../core/rest_client/custom_dio.dart';
import '../../models/product_model.dart';
import 'products_repository.dart';

class ProductsRepositoryImpl implements ProductsRepostitory {
  final CustomDio _dio;

  const ProductsRepositoryImpl({required CustomDio dio}) : _dio = dio;

  @override
  Future<List<ProductModel>> findAllProducts() async {
    try {
      final response = await _dio.unauth().get('/products');
      return (response.data as List)
          .cast<Map<String, dynamic>>()
          .map<ProductModel>(ProductModel.fromMap)
          .toList();
    } on DioError catch (e, s) {
      log('Erro ao buscar produtos', error: e, stackTrace: s);
      throw RepositoryExceptions(message: 'Erro ao buscar produtos');
    }
  }
}

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:vakinha_burger_bloc/app/core/config/env/env.dart';

class CustomDio extends DioForNative {
  CustomDio()
      : super(BaseOptions(
          baseUrl: Env.instance['backend_base_url'] ?? '',
          connectTimeout: const Duration(seconds: 5000),
          receiveTimeout: const Duration(seconds: 60000),
        )) {
    interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        requestHeader: true,
      ),
    );
  }

  CustomDio auth() {
    return this;
  }

  CustomDio anauth() {
    return this;
  }
}

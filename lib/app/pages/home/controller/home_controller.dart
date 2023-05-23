import 'dart:developer';

import 'package:bloc/bloc.dart';

import '../../../repositories/products/products_repository.dart';
import 'home_state.dart';

class HomeController extends Cubit<HomeState> {
  final ProductsRepostitory _productsRepostitory;

  HomeController({required ProductsRepostitory productsRepository})
      : _productsRepostitory = productsRepository,
        super(const HomeState.initial());

  Future<void> loadProducts() async {
    emit(state.copyWith(status: HomeStateStatus.loading));

    try {
      final products = await _productsRepostitory.findAllProducts();
      emit(state.copyWith(status: HomeStateStatus.loaded, products: products));
    } catch (e, s) {
      log('Erro ao buscar produtos', error: e, stackTrace: s);
      emit(state.copyWith(
        status: HomeStateStatus.error,
        errorMessage: 'Erro ao buscar produtos',
      ));
    }
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';

class ProductController extends Cubit<int> {
  ProductController() : super(1);

  void increment() => emit(state + 1);

  void decrement() {
    if (state > 1) {
      emit(state - 1);
    }
  }
}

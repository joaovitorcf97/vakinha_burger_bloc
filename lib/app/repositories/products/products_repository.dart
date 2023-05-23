import 'package:vakinha_burger_bloc/app/models/product_model.dart';

abstract class ProductsRepostitory {
  Future<List<ProductModel>> findAllProducts();
}

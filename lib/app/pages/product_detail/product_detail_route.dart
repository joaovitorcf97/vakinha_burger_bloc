import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vakinha_burger_bloc/app/pages/product_detail/controller/product_controller.dart';
import 'package:vakinha_burger_bloc/app/pages/product_detail/product_detail_page.dart';

class ProductDetailRoute {
  ProductDetailRoute._();

  static Widget get page => MultiProvider(
        providers: [
          Provider(create: (context) => ProductController()),
        ],
        builder: (context, child) {
          final args = ModalRoute.of(context)!.settings.arguments
              as Map<String, dynamic>;

          return ProductDetailPage(
            product: args['product'],
            orderProduct: args['order'],
          );
        },
      );
}

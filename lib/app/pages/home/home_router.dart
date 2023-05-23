import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vakinha_burger_bloc/app/pages/home/home_page.dart';
import 'package:vakinha_burger_bloc/app/repositories/products/products_repository.dart';
import 'package:vakinha_burger_bloc/app/repositories/products/products_repostiory_impl.dart';

import 'controller/home_controller.dart';

class HomeRouter {
  HomeRouter._();

  static Widget get page => MultiProvider(
        providers: [
          Provider<ProductsRepostitory>(
            create: (context) => ProductsRepositoryImpl(dio: context.read()),
          ),
          Provider(
            create: (context) =>
                HomeController(productsRepository: context.read()),
          ),
        ],
        child: const HomePage(),
      );
}

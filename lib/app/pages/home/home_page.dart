import 'package:flutter/material.dart';
import 'package:vakinha_burger_bloc/app/core/ui/widgets/delivery_app_bar.dart';
import 'package:vakinha_burger_bloc/app/models/product_model.dart';
import 'package:vakinha_burger_bloc/app/pages/home/widgets/delivery_product_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppBar(),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return DeliveryProductTile(
                  product: ProductModel(
                      id: 0,
                      name: 'Teste',
                      description: 'Descrição teste',
                      price: 19.0,
                      image:
                          'https://assets.unileversolutions.com/recipes-v2/106684.jpg?imwidth=800'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

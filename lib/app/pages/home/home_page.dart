import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vakinha_burger_bloc/app/core/ui/base_state/base_state.dart';
import 'package:vakinha_burger_bloc/app/core/ui/widgets/delivery_app_bar.dart';
import 'package:vakinha_burger_bloc/app/pages/home/widgets/delivery_product_tile.dart';
import 'package:vakinha_burger_bloc/app/pages/home/widgets/shopping_bag_widget.dart';

import 'controller/home_controller.dart';
import 'controller/home_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage, HomeController> {
  @override
  void onReady() {
    super.onReady();
    controller.loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppBar(),
      body: BlocConsumer<HomeController, HomeState>(
        listener: (context, state) {
          state.status.matchAny(
              any: () => hideLoader(),
              loading: () => showLoader(),
              error: () {
                hideLoader();
                showError(state.errorMessage ?? 'Erro não informado');
              });
        },
        buildWhen: (previous, current) {
          return current.status.matchAny(
            any: () => false,
            initial: () => true,
            loaded: () => true,
          );
        },
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: state.products.length,
                  itemBuilder: (context, index) {
                    final product = state.products[index];
                    final orders = state.shopInBag
                        .where((order) => order.product == product);

                    return DeliveryProductTile(
                      product: product,
                      orderProduct: orders.isNotEmpty ? orders.first : null,
                    );
                  },
                ),
              ),
              Visibility(
                visible: state.shopInBag.isNotEmpty,
                child: ShoppingBagWidget(bag: state.shopInBag),
              ),
            ],
          );
        },
      ),
    );
  }
}

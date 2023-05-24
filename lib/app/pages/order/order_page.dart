import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vakinha_burger_bloc/app/core/ui/helpers/size_extensions.dart';
import 'package:vakinha_burger_bloc/app/core/ui/styles/text_styles.dart';
import 'package:vakinha_burger_bloc/app/core/ui/widgets/delivery_app_bar.dart';
import 'package:vakinha_burger_bloc/app/core/ui/widgets/delivery_button.dart';
import 'package:vakinha_burger_bloc/app/dto/order_product_dto.dart';
import 'package:vakinha_burger_bloc/app/models/product_model.dart';
import 'package:vakinha_burger_bloc/app/pages/order/controllers/order_controller.dart';
import 'package:vakinha_burger_bloc/app/pages/order/controllers/order_state.dart';
import 'package:vakinha_burger_bloc/app/pages/order/widget/order_field.dart';
import 'package:vakinha_burger_bloc/app/pages/order/widget/order_product._tile.dart';
import 'package:vakinha_burger_bloc/app/pages/order/widget/payment_types_fields.dart';
import 'package:validatorless/validatorless.dart';

import '../../core/ui/base_state/base_state.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends BaseState<OrderPage, OrderController> {
  @override
  void onReady() {
    final products =
        ModalRoute.of(context)!.settings.arguments as List<OrderProductDTO>;
    controller.load(products);
    super.onReady();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppBar(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Text(
                    'Carrinho',
                    style: context.textStyles.textTitle,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset('assets/images/trashRegular.png'),
                  )
                ],
              ),
            ),
          ),
          BlocSelector<OrderController, OrderState, List<OrderProductDTO>>(
            selector: (state) => state.orderProducts,
            builder: (context, orderProducts) {
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: orderProducts.length,
                  (context, index) {
                    final orderProduct = orderProducts[index];
                    return Column(
                      children: [
                        OrderProductTile(
                          index: index,
                          orderProduct: orderProduct,
                        ),
                        const Divider(color: Colors.grey),
                      ],
                    );
                  },
                ),
              );
            },
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total de pedido',
                        style: context.textStyles.textExtraBold,
                      ),
                      Text(
                        'Valor',
                        style: context.textStyles.textExtraBold.copyWith(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(color: Colors.grey),
                OrderField(
                  title: 'Endereço de entrega',
                  controller: TextEditingController(),
                  validator: Validatorless.required('m'),
                  hintText: 'Digite o endereço',
                ),
                const SizedBox(height: 16),
                OrderField(
                  title: 'CPF',
                  controller: TextEditingController(),
                  validator: Validatorless.required('m'),
                  hintText: 'Digite o CPF',
                ),
                const PaymnetsTypesFields(),
              ],
            ),
          ),
          SliverFillRemaining(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Divider(color: Colors.grey),
                  DeliveryButton(
                    height: 44,
                    width: context.screenWidth,
                    label: 'Comprar',
                    onPressed: () {},
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

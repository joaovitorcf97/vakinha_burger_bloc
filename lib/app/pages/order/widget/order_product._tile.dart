import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vakinha_burger_bloc/app/core/extensions/formatter_extensions.dart';
import 'package:vakinha_burger_bloc/app/core/ui/styles/colors_app.dart';
import 'package:vakinha_burger_bloc/app/core/ui/styles/text_styles.dart';
import 'package:vakinha_burger_bloc/app/core/ui/widgets/delivery_increment_decrement_button.dart';
import 'package:vakinha_burger_bloc/app/dto/order_product_dto.dart';
import 'package:vakinha_burger_bloc/app/pages/order/controllers/order_controller.dart';

class OrderProductTile extends StatelessWidget {
  final int index;
  final OrderProductDTO orderProduct;

  const OrderProductTile({
    super.key,
    required this.index,
    required this.orderProduct,
  });

  @override
  Widget build(BuildContext context) {
    final product = orderProduct.product;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Image.network(
            product.image,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style:
                        context.textStyles.textRegular.copyWith(fontSize: 16),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        (orderProduct.amount * product.price).currencyPTBR,
                        style: context.textStyles.textMedium.copyWith(
                          fontSize: 14,
                          color: context.colors.secondary,
                        ),
                      ),
                      DeliveryIncrementDecrementButton.compact(
                        amount: orderProduct.amount,
                        incrementTap: () {
                          context
                              .read<OrderController>()
                              .incrementProduct(index);
                        },
                        decrementTap: () {
                          context
                              .read<OrderController>()
                              .decrementProduct(index);
                        },
                      ),
                    ],
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

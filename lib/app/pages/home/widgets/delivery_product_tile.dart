import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vakinha_burger_bloc/app/core/extensions/formatter_extensions.dart';
import 'package:vakinha_burger_bloc/app/core/ui/styles/colors_app.dart';
import 'package:vakinha_burger_bloc/app/core/ui/styles/text_styles.dart';
import 'package:vakinha_burger_bloc/app/dto/order_product_dto.dart';

import 'package:vakinha_burger_bloc/app/models/product_model.dart';
import 'package:vakinha_burger_bloc/app/pages/home/controller/home_controller.dart';

class DeliveryProductTile extends StatelessWidget {
  final ProductModel product;
  final OrderProductDTO? orderProduct;

  const DeliveryProductTile({
    Key? key,
    required this.product,
    required this.orderProduct,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final controller = context.read<HomeController>();
        final orderProductResult = await Navigator.of(context).pushNamed(
          '/productDetail',
          arguments: {'product': product, 'order': orderProduct},
        );

        if (orderProductResult != null) {
          controller.addOrUpdateBag(orderProductResult as OrderProductDTO);
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      product.name,
                      style: context.textStyles.textExtraBold.copyWith(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      product.description,
                      style: context.textStyles.textLight.copyWith(
                        fontSize: 13,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      product.price.currencyPTBR,
                      style: context.textStyles.textMedium.copyWith(
                        fontSize: 14,
                        color: context.colors.secondary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: FadeInImage.assetNetwork(
                placeholder: 'assets/images/loading.gif',
                image: product.image,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

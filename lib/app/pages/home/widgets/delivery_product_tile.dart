import 'package:flutter/material.dart';
import 'package:vakinha_burger_bloc/app/core/extensions/formatter_extensions.dart';
import 'package:vakinha_burger_bloc/app/core/ui/styles/colors_app.dart';
import 'package:vakinha_burger_bloc/app/core/ui/styles/text_styles.dart';

import 'package:vakinha_burger_bloc/app/models/product_model.dart';

class DeliveryProductTile extends StatelessWidget {
  final ProductModel product;

  const DeliveryProductTile({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                      fontSize: 12,
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
          FadeInImage.assetNetwork(
            placeholder: 'assets/images/loading.gif',
            image: product.image,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}

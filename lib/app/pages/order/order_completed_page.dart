import 'package:flutter/material.dart';
import 'package:vakinha_burger_bloc/app/core/ui/helpers/size_extensions.dart';
import 'package:vakinha_burger_bloc/app/core/ui/styles/text_styles.dart';
import 'package:vakinha_burger_bloc/app/core/ui/widgets/delivery_button.dart';

class OrderCompletedPage extends StatelessWidget {
  const OrderCompletedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: context.percentHeigt(.2)),
              Image.asset('assets/images/logo_rounded.png'),
              const SizedBox(height: 24),
              Text(
                'Pedido realizado com sucesso!',
                style: context.textStyles.textExtraBold.copyWith(
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              DeliveryButton(
                width: context.percentWidth(.80),
                label: 'FECHAR',
                onPressed: () => Navigator.pop(context),
              )
            ],
          ),
        ),
      ),
    );
  }
}

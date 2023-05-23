import 'package:flutter/material.dart';
import 'package:vakinha_burger_bloc/app/core/ui/widgets/delivery_app_bar.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppBar(),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
            child: Column(
          children: [],
        )),
      )),
    );
  }
}

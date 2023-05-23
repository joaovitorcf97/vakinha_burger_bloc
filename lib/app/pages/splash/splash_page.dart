import 'package:flutter/material.dart';
import 'package:vakinha_burger_bloc/app/core/config/env/env.dart';

import '../../core/widgets/delivery_button.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Splash"),
      ),
      body: Column(
        children: [
          Container(),
          DeliveryButton(
            label: Env.instance['backend_base_url'] ?? '',
            onPressed: () {},
          ),
          TextFormField(
            decoration: InputDecoration(label: Text('teste')),
          )
        ],
      ),
    );
  }
}

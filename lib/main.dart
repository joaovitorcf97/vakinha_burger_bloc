import 'package:flutter/material.dart';
import 'package:vakinha_burger_bloc/app/core/config/env/env.dart';
import 'package:vakinha_burger_bloc/app/delivery_app.dart';

void main() async {
  await Env.instance.load();

  runApp(const DeliveryApp());
}

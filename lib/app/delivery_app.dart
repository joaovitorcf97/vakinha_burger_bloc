import 'package:flutter/material.dart';
import 'package:vakinha_burger_bloc/app/core/ui/theme/theme_config.dart';
import 'package:vakinha_burger_bloc/app/pages/splash/splash_page.dart';

class DeliveryApp extends StatelessWidget {
  const DeliveryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Delivery App',
      theme: ThemeConfig.theme,
      routes: {
        '/': (context) => const SplashPage(),
      },
    );
  }
}

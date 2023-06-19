import 'package:flutter/material.dart';
import 'package:vakinha_burger_bloc/app/core/global/global_context.dart';
import 'package:vakinha_burger_bloc/app/core/provider/application_binding.dart';
import 'package:vakinha_burger_bloc/app/core/ui/theme/theme_config.dart';
import 'package:vakinha_burger_bloc/app/pages/auth/login/login_router.dart';
import 'package:vakinha_burger_bloc/app/pages/auth/register/register_router.dart';
import 'package:vakinha_burger_bloc/app/pages/order/order_completed_page.dart';
import 'package:vakinha_burger_bloc/app/pages/order/order_router.dart';
import 'package:vakinha_burger_bloc/app/pages/product_detail/product_detail_route.dart';
import 'package:vakinha_burger_bloc/app/pages/splash/splash_page.dart';

import 'pages/home/home_router.dart';

class DeliveryApp extends StatelessWidget {
  final _navKey = GlobalKey<NavigatorState>();

  DeliveryApp({super.key}) {
    GlobalContext.instance.navigatorKey = _navKey;
  }

  @override
  Widget build(BuildContext context) {
    return ApplicationBinding(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Delivery App',
        theme: ThemeConfig.theme,
        navigatorKey: _navKey,
        routes: {
          '/': (context) => const SplashPage(),
          '/home': (context) => HomeRouter.page,
          '/productDetail': (context) => ProductDetailRoute.page,
          '/auth/login': (context) => LoginRouter.page,
          '/auth/register': (context) => RegisterRouter.page,
          '/order': (context) => OrderRouter.page,
          '/order/completed': (context) => const OrderCompletedPage(),
        },
      ),
    );
  }
}

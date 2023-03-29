import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vakinha_burger/app/pages/order/order.dart';
import 'package:vakinha_burger/app/pages/order/order_controller.dart';

class OrderRouter {
  OrderRouter._();

  static Widget get page => MultiProvider(
        providers: [
          Provider(create: (context) => OrderController()),
        ],
        child: const OrderPage(),
      );
}

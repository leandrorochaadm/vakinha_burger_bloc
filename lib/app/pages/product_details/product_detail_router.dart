import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'product_details.dart';

class ProductDetailsRouter {
  ProductDetailsRouter._();

  static Widget get page => MultiProvider(
        providers: [
          Provider(
            create: (context) => Object(),
          )
        ],
        child: const ProductDetailPage(),
      );
}

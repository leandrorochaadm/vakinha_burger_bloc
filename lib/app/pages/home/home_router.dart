import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../repositories/repositories.dart';
import 'home.dart';

class HomeRouter {
  HomeRouter._();

  static Widget get page => MultiProvider(
        providers: [
          Provider<ProductsRepository>(
            create: (context) => ProductRepositoryImpl(dio: context.read()),
          )
        ],
        child: const HomePage(),
      );
}

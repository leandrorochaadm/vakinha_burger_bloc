import 'package:flutter/material.dart';
import 'package:vakinha_burger/app/core/core.dart';
import 'package:vakinha_burger/app/pages/pages.dart';

class VakinhaBurgerAPP extends StatelessWidget {
  const VakinhaBurgerAPP({super.key});

  @override
  Widget build(BuildContext context) {
    return ApplicationBinding(
      child: MaterialApp(
        title: 'Vakinha Burger',
        debugShowCheckedModeBanner: false,
        theme: ThemeConfig.theme,
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashPage(),
          '/home': (context) => HomeRouter.page,
          '/productDetail': (context) => ProductDetailsRouter.page,
        },
      ),
    );
  }
}

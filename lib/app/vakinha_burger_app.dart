import 'package:flutter/material.dart';
import 'package:vakinha_burger/app/pages/splash/splash_page.dart';

class VakinhaBurgerAPP extends StatelessWidget {
  const VakinhaBurgerAPP({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vakinha Burger',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashPage(),
      },
    );
  }
}

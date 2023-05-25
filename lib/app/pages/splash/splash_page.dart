import 'package:flutter/material.dart';
import 'package:vakinha_burger/app/core/ui/helper/size_extesions.dart';

import '../../core/ui/styles/styles.dart';
import '../../core/ui/widgets/widgets.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColoredBox(
        color: const Color(0XFF140E0E),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: context.screenWidth,
                child: Image.asset(
                  'assets/images/lanche.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              child: Column(
                children: [
                  SizedBox(height: context.percentHeight(.2)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Image.asset('assets/images/logo2.png'),
                  ),
                  Text(
                    'Delivery Fast',
                    style: TextStyle(
                      color: ColorsApp.i.primary,
                      fontSize: 55,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 80),
                  DeliveryButton(
                    label: 'ACESSAR',
                    width: context.percentWidth(0.6),
                    height: 35,
                    onPressed: () => Navigator.pushNamed(context, '/home'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

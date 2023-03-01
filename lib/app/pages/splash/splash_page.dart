import 'package:flutter/material.dart';
import 'package:vakinha_burger/app/core/ui/helper/size_extesions.dart';

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
                  SizedBox(height: context.percentHeight(.3)),
                  Image.asset('assets/images/logo.png'),
                  SizedBox(height: 80),
                  DeliveryButton(
                    label: 'ACESSAR',
                    width: context.percentWidth(0.6),
                    height: 35,
                    onPressed: () {},
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

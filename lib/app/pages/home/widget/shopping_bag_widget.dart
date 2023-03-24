import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vakinha_burger/app/core/core.dart';
import 'package:vakinha_burger/app/core/extensions/formatter_extension.dart';
import 'package:vakinha_burger/app/core/ui/styles/text_styles.dart';

import '../../../dto/dto.dart';

class ShoppingBagWidget extends StatelessWidget {
  final List<OrderProductDto> bag;

  const ShoppingBagWidget({Key? key, required this.bag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var totalBag = bag
        .fold<double>(0.0, (total, element) => total += element.totalPrice)
        .currencyPTBR;

    return Container(
      width: context.screenWidth,
      height: 90,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
          )
        ],
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
          topLeft: Radius.circular(10),
        ),
      ),
      child: ElevatedButton(
        onPressed: () => _goOrder(context),
        child: Stack(
          children: [
            const Align(
                alignment: Alignment.centerLeft,
                child: Icon(Icons.shopping_cart_outlined)),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Ver Sacola',
                style: context.textStyles.textExtraBold.copyWith(fontSize: 14),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                totalBag,
                style: context.textStyles.textExtraBold.copyWith(fontSize: 11),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _goOrder(BuildContext context) async {
    final navigator = Navigator.of(context);
    final sp = await SharedPreferences.getInstance();
    if (!sp.containsKey('accessToken')) {
      //envio pra o login
      final loginResult = await navigator.pushNamed('/auth/login');
    }
    // envio pra o order
  }
}

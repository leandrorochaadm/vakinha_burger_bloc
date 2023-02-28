import 'package:flutter/material.dart';
import 'package:vakinha_burger/app/core/ui/widgets/widgets.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Splash'),
      ),
      body: Column(children: [
        Container(),
        ElevatedButton(onPressed: () {}, child: Text('Teste')),
        TextFormField(decoration: InputDecoration(labelText: 'text')),
        DeliveryButton(
          label: 'Delivery button',
          width: 200,
          height: 80,
          onPressed: () {},
        ),
      ]),
    );
  }
}

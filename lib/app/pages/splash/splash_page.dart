import 'package:flutter/material.dart';
import 'package:vakinha_burger/app/core/config/env/env.dart';
import 'package:vakinha_burger/app/core/ui/helper/size_extesions.dart';
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
          label: Env.i['backend_base_url'] ?? '',
          width: 200,
          height: 80,
          onPressed: () {},
        ),
        Row(
          children: [
            SizedBox(
              width: context.percentWidth(.45),
              height: context.percentHeight(.1),
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Azul'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              ),
            ),
            SizedBox(
              width: context.percentWidth(.55),
              height: context.percentHeight(.05),
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Vermelho'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              ),
            ),
          ],
        )
      ]),
    );
  }
}

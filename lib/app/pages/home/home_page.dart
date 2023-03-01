import 'package:flutter/material.dart';
import 'package:vakinha_burger/app/core/ui/widgets/deliveryAppBar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppBar(),
      body: Center(
        child: Text('Home Page'),
      ),
    );
  }
}

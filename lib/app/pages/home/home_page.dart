import 'package:flutter/material.dart';
import 'package:vakinha_burger/app/core/ui/ui.dart';
import 'package:vakinha_burger/app/models/product_model.dart';

import '../../core/ui/widgets/widgets.dart';
import 'widget/widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with Loader, Messages {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppBar(),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return DeliveryProductTile(
                  product: ProductModel(
                    name: 'name',
                    description: "Porção de 500g Calabresa acebolada",
                    price: 19,
                    imagePath:
                        "https://www.anamariabrogui.com.br/assets/uploads/receitas/fotos/usuario-1682-52acab79d88efd805e6a341697e6aecb.jpg",
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

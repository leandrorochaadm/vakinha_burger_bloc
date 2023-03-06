import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:vakinha_burger/app/core/core.dart';
import 'package:vakinha_burger/app/core/ui/styles/styles.dart';

import '../../core/ui/widgets/widgets.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: context.screenWidth,
            height: context.percentHeight(.4),
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      "https://www.anamariabrogui.com.br/assets/uploads/receitas/fotos/usuario-1682-52acab79d88efd805e6a341697e6aecb.jpg"),
                  fit: BoxFit.cover),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text('Calabresa',
                style: context.textStyles.textExtraBold.copyWith(fontSize: 22)),
          ),
          const SizedBox(height: 10),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: SingleChildScrollView(
                child: Text(
                    'Lanche acompanha pão, calabresa, vinagrete, queijo e maionese'),
              ),
            ),
          ),
          const Divider(),
          Row(
            children: [
              SizedBox(
                  width: context.percentWidth(0.5),
                  child: Text('botão incremente')),
              Container(
                width: context.percentWidth(.5),
                height: 68,
                padding: EdgeInsets.all(8),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Adicionar',
                        style: context.textStyles.textExtraBold
                            .copyWith(fontSize: 13),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: AutoSizeText(
                          r'R$ 60,99',
                          maxFontSize: 13,
                          minFontSize: 5,
                          maxLines: 1,
                          style: context.textStyles.textExtraBold
                              .copyWith(fontSize: 13),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vakinha_burger/app/core/core.dart';
import 'package:vakinha_burger/app/core/extensions/formatter_extension.dart';
import 'package:vakinha_burger/app/core/ui/styles/styles.dart';
import 'package:vakinha_burger/app/models/models.dart';
import 'package:vakinha_burger/app/pages/product_details/product_detail_controller.dart';

import '../../core/ui/widgets/widgets.dart';

class ProductDetailPage extends StatefulWidget {
  final ProductModel product;

  const ProductDetailPage({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState
    extends BaseState<ProductDetailPage, ProductDetailController> {
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
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(widget.product.imagePath),
                  fit: BoxFit.cover),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(widget.product.name,
                style: context.textStyles.textExtraBold.copyWith(fontSize: 22)),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SingleChildScrollView(
                child: Text(widget.product.description),
              ),
            ),
          ),
          const Divider(),
          Row(
            children: [
              Container(
                width: context.percentWidth(0.5),
                height: 68,
                padding: const EdgeInsets.all(8.0),
                child: BlocBuilder<ProductDetailController, int>(
                    builder: (context, amount) {
                  return DeliveryIncrementDecrementButton(
                    decrementTap: () => controller.decrement(),
                    incrementTap: () => controller.increment(),
                    amount: amount,
                  );
                }),
              ),
              Container(
                width: context.percentWidth(.5),
                height: 68,
                padding: const EdgeInsets.all(8),
                child: BlocBuilder<ProductDetailController, int>(
                    builder: (context, amount) {
                  return ElevatedButton(
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
                            (widget.product.price * amount).currencyPTBR,
                            maxFontSize: 13,
                            minFontSize: 5,
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            style: context.textStyles.textExtraBold
                                .copyWith(fontSize: 13),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ],
          )
        ],
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vakinha_burger/app/core/extensions/formatter_extension.dart';
import 'package:vakinha_burger/app/core/ui/styles/colors_app.dart';
import 'package:vakinha_burger/app/core/ui/styles/text_styles.dart';
import 'package:vakinha_burger/app/dto/dto.dart';
import 'package:vakinha_burger/app/models/product_model.dart';
import 'package:vakinha_burger/app/pages/home/home_controller.dart';

class DeliveryProductTile extends StatelessWidget {
  final ProductModel product;
  final OrderProductDto? orderProduct;

  const DeliveryProductTile({
    Key? key,
    required this.product,
    this.orderProduct,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final controller = context.read<HomeController>();
        final orderProductResult = await Navigator.pushNamed(
          context,
          '/productDetail',
          arguments: {
            'product': product,
            'order': orderProduct,
          },
        );
        if (orderProductResult != null) {
          controller.addOrUpdateBag(orderProductResult as OrderProductDto);
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      product.name,
                      style: context.textStyles.textExtraBold
                          .copyWith(fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      product.description,
                      style:
                          context.textStyles.textRegular.copyWith(fontSize: 13),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      product.price.currencyPTBR,
                      style: context.textStyles.textMedium.copyWith(
                        fontSize: 13,
                        color: context.colors.secondary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            CachedNetworkImage(
              imageUrl: product.imagePath,
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              height: 100,
              width: 100,
              fit: BoxFit.contain,
            ),
            /*FadeInImage.assetNetwork(
              placeholder: 'assets/images/loading.gif',
              image: product.imagePath,
              width: 100,
              height: 100,
              fit: BoxFit.contain,
            ),*/
          ],
        ),
      ),
    );
  }
}

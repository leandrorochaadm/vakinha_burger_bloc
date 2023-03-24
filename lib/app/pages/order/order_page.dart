import 'package:flutter/material.dart';
import 'package:vakinha_burger/app/core/ui/styles/text_styles.dart';
import 'package:vakinha_burger/app/core/ui/widgets/delivery_app_bar.dart';
import 'package:vakinha_burger/app/dto/dto.dart';
import 'package:vakinha_burger/app/models/models.dart';
import 'package:vakinha_burger/app/pages/order/widget/order_product_tile.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppBar(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  Text(
                    'Carinho',
                    style: context.textStyles.textTitle,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Image.asset('assets/images/trashRegular.png')),
                ],
              ),
            ),
          ),
          SliverList(
              delegate:
                  SliverChildBuilderDelegate(childCount: 2, (context, index) {
            return Column(
              children: [
                OrderProductTile(
                    index: index,
                    orderProduct: OrderProductDto(
                      amount: 10,
                      product: ProductModel.fromJson({}),
                    )),
                const Divider(color: Colors.grey),
              ],
            );
          })),
        ],
      ),
    );
  }
}

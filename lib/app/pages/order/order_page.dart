import 'package:flutter/material.dart';
import 'package:vakinha_burger/app/core/ui/styles/text_styles.dart';
import 'package:vakinha_burger/app/core/ui/widgets/delivery_app_bar.dart';
import 'package:vakinha_burger/app/core/ui/widgets/delivery_button.dart';
import 'package:vakinha_burger/app/dto/dto.dart';
import 'package:vakinha_burger/app/models/models.dart';
import 'package:vakinha_burger/app/pages/order/order_controller.dart';
import 'package:validatorless/validatorless.dart';

import '../../core/core.dart';
import 'widget/widget.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends BaseState<OrderPage, OrderController> {
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
              delegate: SliverChildBuilderDelegate(
            childCount: 1,
            (context, index) {
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
            },
          )),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total do pedido',
                          style: context.textStyles.textExtraBold
                              .copyWith(fontSize: 16),
                        ),
                        Text(
                          r'R$ Valor 200,00',
                          style: context.textStyles.textExtraBold
                              .copyWith(fontSize: 16),
                        ),
                      ]),
                ),
                const Divider(color: Colors.grey),
                OrderField(
                  title: 'Endereço de entrega',
                  controller: TextEditingController(),
                  validator: Validatorless.required('m'),
                  hintText: 'Digite um endereço',
                ),
                const SizedBox(height: 10),
                OrderField(
                  title: 'CPF',
                  controller: TextEditingController(),
                  validator: Validatorless.required('m'),
                  hintText: 'Digite o CPF',
                ),
                const SizedBox(height: 10),
                const PaymentTypesField(),
              ],
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Divider(color: Colors.grey),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: DeliveryButton(
                    width: double.infinity,
                    height: 48,
                    label: 'FINALIZAR',
                    onPressed: () {},
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

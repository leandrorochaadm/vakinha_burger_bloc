import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vakinha_burger/app/core/ui/ui.dart';
import 'package:vakinha_burger/app/pages/home/home_controller.dart';
import 'package:vakinha_burger/app/pages/home/home_state.dart';

import '../../core/ui/widgets/widgets.dart';
import 'widget/widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage, HomeController>
    with Loader, Messages {
  @override
  void onReady() {
    controller.loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppBar(),
      body: BlocConsumer<HomeController, HomeState>(
          listener: (context, state) => state.status.matchAny(
                any: () => hideLoader(),
                loading: () => showLoader(),
                error: () {
                  hideLoader();
                  showError(state.errorMessage ?? 'Erro não informado');
                },
              ),
          buildWhen: (previous, current) => current.status.matchAny(
                any: () => false,
                initial: () => true,
                loaded: () => true,
              ),
          builder: (context, state) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: state.products.length,
                    itemBuilder: (context, index) {
                      final product = state.products[index];
                      return DeliveryProductTile(product: product);
                    },
                  ),
                )
              ],
            );
          }),
    );
  }
}

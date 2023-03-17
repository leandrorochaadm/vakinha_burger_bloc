import 'package:flutter/material.dart';
import 'package:vakinha_burger/app/core/ui/styles/text_styles.dart';

import '../../../core/ui/widgets/widgets.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppBar(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Login',
                    style: context.textStyles.textTitle,
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'E-mail'),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Senha'),
                  ),
                  const SizedBox(height: 50),
                  Center(
                    child: DeliveryButton(
                      label: 'ENTRAR',
                      width: double.infinity,
                      onPressed: () =>
                          Navigator.pushNamed(context, '/auth/register'),
                    ),
                  )
                ],
              )),
            ),
          ),
          SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Não possui uma conta ',
                            style: context.textStyles.textBold),
                        InkWell(
                          onTap: () =>
                              Navigator.pushNamed(context, '/auth/register'),
                          child: Text(
                            'Cadastra-se',
                            style: context.textStyles.textBold
                                .copyWith(color: Colors.blue),
                          ),
                        )
                      ]),
                ),
              )),
        ],
      ),
    );
  }
}

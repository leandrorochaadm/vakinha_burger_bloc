import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vakinha_burger/app/core/ui/styles/text_styles.dart';
import 'package:vakinha_burger/app/core/ui/widgets/delivery_app_bar.dart';
import 'package:vakinha_burger/app/core/ui/widgets/delivery_button.dart';
import 'package:vakinha_burger/app/pages/auth/register/register_controller.dart';
import 'package:vakinha_burger/app/pages/auth/register/register_state.dart';
import 'package:validatorless/validatorless.dart';

import '../../../core/ui/ui.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends BaseState<RegisterPage, RegisterController> {
  final _formKey = GlobalKey<FormState>();

  final _nameEC = TextEditingController();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();

  @override
  void dispose() {
    _nameEC.dispose();
    _emailEC.dispose();
    _passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterController, RegisterState>(
      listener: (BuildContext context, state) {
        state.status.matchAny(
          any: () => hideLoader(),
          register: () => showLoader(),
          error: () {
            hideLoader();
            showError('Erro ao registrar usuario');
          },
          success: () {
            hideLoader();
            showSuccess('Cadastro realizado com sucesso');
            Navigator.pop(context);
          },
        );
      },
      child: Scaffold(
        appBar: DeliveryAppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Cadastro', style: context.textStyles.textTitle),
                    Text(
                      'Preencha os campos abaixo para criar o seu cadastro',
                      style:
                          context.textStyles.textMedium.copyWith(fontSize: 18),
                    ),
                    const SizedBox(height: 30),
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Nome'),
                      validator: Validatorless.required('Nome obrigatório'),
                      controller: _nameEC,
                    ),
                    const SizedBox(height: 30),
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'E-mail'),
                      validator: Validatorless.multiple([
                        Validatorless.required('E-mail obrigatório'),
                        Validatorless.email('E-mail inválido'),
                      ]),
                      controller: _emailEC,
                    ),
                    const SizedBox(height: 30),
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Senha'),
                      obscureText: true,
                      validator: Validatorless.multiple([
                        Validatorless.required('Senha obrigátória'),
                        Validatorless.min(
                          6,
                          'Senha tem que conter pelo menos 6 caracteres',
                        ),
                      ]),
                      controller: _passwordEC,
                      // validator:,
                    ),
                    const SizedBox(height: 30),
                    TextFormField(
                      decoration:
                          const InputDecoration(labelText: 'Confirma Senha'),
                      obscureText: true,
                      validator: Validatorless.multiple([
                        Validatorless.required('Confirma senha obrigátória'),
                        Validatorless.compare(
                            _passwordEC, 'Senha diferente de confirma senha'),
                      ]),
                    ),
                    const SizedBox(height: 30),
                    DeliveryButton(
                      label: 'Cadastrar',
                      width: double.infinity,
                      onPressed: () {
                        final valid =
                            _formKey.currentState?.validate() ?? false;
                        if (valid) {
                          controller.register(
                              _nameEC.text, _emailEC.text, _passwordEC.text);
                        }
                      },
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }
}

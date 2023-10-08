import 'package:agenda_nail_app/src/modules/auth/controller/login_controller.dart';
import 'package:agenda_nail_app/src/modules/auth/dtos/user_credential_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  var dto = UserCredentialDTO();
  @override
  Widget build(BuildContext context) {
    var controller = context.watch<LoginController>();
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 0, left: 32, right: 32),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('Entrar',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.displayMedium),
                    const SizedBox(height: 32),
                    Text(
                        'Caso já tenha uma conta, informe os dados de acesso logo abaixo',
                        style: Theme.of(context).textTheme.bodyLarge),
                    const SizedBox(height: 32),
                    Text(
                      'Email para acesso',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    TextFormField(
                      onChanged: (value) => dto.email = value,
                      validator: controller.emailValidator(),
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        hintText: 'seu_email@example.com',
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Senha para acesso',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    TextFormField(
                      onChanged: (value) => dto.password = value,
                      validator: controller.passwordValidator(),
                      decoration: const InputDecoration(hintText: 'Senha'),
                      obscureText: true,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          await controller.getToken(dto);
                        } else {}
                      },
                      child: controller.isLoading
                          ? const SizedBox(
                              height: 24,
                              width: 24,
                              child: CircularProgressIndicator(),
                            )
                          : const Text('Entrar'),
                    ),
                    const SizedBox(height: 8),
                    TextButton(
                      onPressed: () {
                        Modular.to.pushNamed('./new');
                      },
                      child: const Text('Criar uma nova conta!'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

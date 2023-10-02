import 'package:agenda_nail_app/src/modules/auth/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../dtos/user_credential_dto.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  var dto = UserCredentialDTO();
  @override
  Widget build(BuildContext context) {
    var controller = context.watch<AuthController>();
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 0, left: 32, right: 32),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('Cadastrar',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.displayMedium),
                    const SizedBox(height: 32),
                    Text(
                        'Vamos criar um breve cadastro para te manter sempre por dentro de todas as atualizações no seu agendamento',
                        style: Theme.of(context).textTheme.bodyLarge),
                    const SizedBox(height: 16),
                    Text(
                      'Qual é o seu nome?',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    TextFormField(
                      onChanged: (value) => dto.userName = value,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(hintText: 'Seu Nome'),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Um celular para contato',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    TextFormField(
                      onChanged: (value) => dto.cellPhone = value,
                      maxLength: 15,
                      keyboardType: TextInputType.phone,
                      decoration:
                          const InputDecoration(hintText: '(47) 00000-0000'),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Email para acesso',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    TextFormField(
                      onChanged: (value) => dto.email = value,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                          hintText: 'seu_email@example.com'),
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
                      decoration: const InputDecoration(hintText: 'Senha'),
                      obscureText: true,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        controller.createAccount(dto);
                      },
                      child: const Text('Registrar'),
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

  void _submitForm() {
    // Aqui você pode adicionar lógica para processar os dados de registro, como fazer uma chamada de API para criar uma conta.

    // Exemplo:
    // if (email.isNotEmpty && password.isNotEmpty) {
    //   // Faça a chamada de API ou o processamento necessário aqui.
    // }
  }
}

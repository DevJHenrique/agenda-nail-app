import 'package:agenda_nail_app/src/modules/auth/controller/create_account_controller.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../dtos/user_credential_dto.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final formKey = GlobalKey<FormState>();
  var dto = UserCredentialDTO();
  @override
  Widget build(BuildContext context) {
    var controller = context.watch<CreateAccountController>();
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
                      validator: controller.nameValidator(),
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
                      onChanged: (value) => dto.cellPhone =
                          UtilBrasilFields.obterTelefone(value, mascara: false),
                      validator: controller.phoneValidator(),
                      maxLength: 15,
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        TelefoneInputFormatter()
                      ],
                      decoration: const InputDecoration(
                        hintText: '(47) 00000-0000',
                        counterText: "",
                      ),
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
                      validator: controller.emailValidator(),
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
                      validator: controller.passwordValidator(),
                      decoration: const InputDecoration(hintText: 'Senha'),
                      obscureText: true,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          await controller.createAccount(dto);
                          print('valid');
                        } else {
                          print(dto.cellPhone);
                        }
                      },
                      child: controller.isLoading
                          ? const SizedBox(
                              height: 24,
                              width: 24,
                              child: CircularProgressIndicator(),
                            )
                          : const Text('Registrar'),
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

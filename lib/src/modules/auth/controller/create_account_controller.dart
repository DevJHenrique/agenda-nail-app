import 'package:agenda_nail_app/src/modules/core/authentication/controllers/auth_controller.dart';
import 'package:agenda_nail_app/src/modules/auth/dtos/user_credential_dto.dart';
import 'package:agenda_nail_app/src/modules/core/authentication/models/token_entity.dart';
import 'package:agenda_nail_app/src/modules/core/authentication/states/auth_state.dart';
import 'package:flutter/foundation.dart';
import 'package:validatorless/validatorless.dart';

class CreateAccountController extends ChangeNotifier {
  final AuthController _authController;

  CreateAccountController(this._authController);

  AuthState get state => _authController.state;

  TokenEntity? token;
  bool isLoading = false;

  Future<TokenEntity?> createAccount(UserCredentialDTO user) async {
    isLoading = true;
    notifyListeners();

    await _authController.createAccount(user);

    isLoading = false;
    notifyListeners();

    return token;
  }

  String? Function(String?)? emailValidator() {
    var validate = Validatorless.multiple([
      Validatorless.required('E-mail é necessário!'),
      Validatorless.email('E-mail inválido!'),
    ]);

    return validate;
  }

  String? Function(String?)? passwordValidator() {
    var validate = Validatorless.multiple([
      Validatorless.required('Senha é necessária!'),
      Validatorless.min(
          6, 'Precisamos de uma senha com no mínimo 6 caracteres'),
    ]);

    return validate;
  }

  String? Function(String?)? nameValidator() {
    var validate = Validatorless.multiple([
      Validatorless.required('Precisamos de um nome para te indentificar!'),
      Validatorless.min(3, 'Nome inválido!'),
    ]);

    return validate;
  }

  String? Function(String?)? phoneValidator() {
    var validate = Validatorless.multiple([
      Validatorless.required('Precisamos de um telefone para contato'),
      Validatorless.min(14, 'Telefone inválido!'),
    ]);

    return validate;
  }
}

import 'package:agenda_nail_app/src/modules/auth/controller/auth_controller.dart';
import 'package:agenda_nail_app/src/modules/auth/dtos/user_credential_dto.dart';
import 'package:agenda_nail_app/src/modules/auth/models/token_entity.dart';
import 'package:flutter/foundation.dart';
import 'package:validatorless/validatorless.dart';

class LoginController extends ChangeNotifier {
  final AuthController _authController;

  LoginController(this._authController);

  TokenEntity? token;
  bool isLoading = false;
  String? messageErros;

  Future<void> getToken(UserCredentialDTO user) async {
    isLoading = true;
    notifyListeners();

    token = await _authController.loginWithEmail(user);

    isLoading = false;
    notifyListeners();
  }

  String? Function(String?)? emailValidator() {
    var validate = Validatorless.multiple([
      Validatorless.required('E-mail é necessário!'),
      Validatorless.email('E-mail inválido!'),
    ]);

    return validate;
  }

  String? Function(String?)? passwordValidator() {
    var validate = Validatorless.required('Senha é necessária!');

    return validate;
  }
}

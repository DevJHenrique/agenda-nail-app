import 'package:agenda_nail_app/src/modules/core/authentication/controllers/auth_controller.dart';
import 'package:agenda_nail_app/src/modules/auth/dtos/user_credential_dto.dart';
import 'package:agenda_nail_app/src/modules/core/authentication/states/auth_state.dart';
import 'package:flutter/foundation.dart';
import 'package:validatorless/validatorless.dart';

class LoginController extends ChangeNotifier {
  final AuthController _authController;

  LoginController(this._authController);

  AuthState get state => _authController.state;

  bool isLoading = false;
  String? messageErros;

  Future<bool> getToken(UserCredentialDTO user) async {
    isLoading = true;
    notifyListeners();

    await _authController.loginWithEmail(user);
    isLoading = false;
    notifyListeners();

    if (state is Authenticated) {
      return true;
    } else {
      return false;
    }
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

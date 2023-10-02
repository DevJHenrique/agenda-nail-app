import 'package:agenda_nail_app/src/modules/auth/dtos/user_credential_dto.dart';
import 'package:agenda_nail_app/src/modules/auth/services/auth_service.dart';
import 'package:flutter/foundation.dart';

class AuthController extends ChangeNotifier {
  final AuthService service;

  AuthController(this.service);

  void createAccount(UserCredentialDTO user) {
    service.createAccountWithEmail(user);
  }
}

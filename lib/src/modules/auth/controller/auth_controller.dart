import 'package:agenda_nail_app/src/modules/auth/dtos/user_credential_dto.dart';
import 'package:agenda_nail_app/src/modules/auth/models/token_entity.dart';
import 'package:agenda_nail_app/src/modules/auth/repositories/auth_repository.dart';

import 'package:flutter/foundation.dart';

class AuthController extends ChangeNotifier {
  final AuthRepository _repository;

  AuthController(this._repository);

  Future<TokenEntity> createAccount(UserCredentialDTO user) async {
    var token = await _repository.createUserWithEmail(user);
    return token!;
  }

  Future<TokenEntity> loginWithEmail(UserCredentialDTO user) async {
    var token = await _repository.loginWithEmail(user);
    return token!;
  }

  Future<void> checkAuth() async {
    await _repository.checkAuth();
  }

  Future<void> logout() async {
    await _repository.logout();
  }
}

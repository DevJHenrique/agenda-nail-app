import 'package:flutter/foundation.dart';

import 'package:agenda_nail_app/src/modules/auth/dtos/user_credential_dto.dart';
import 'package:agenda_nail_app/src/modules/core/models/token_entity.dart';

import '../repositories/authentication/auth_repository.dart';

class AuthController extends ChangeNotifier {
  final AuthRepository _repository;
  AuthController(this._repository);

  TokenEntity? token;
  bool isAuthenticated = false;

  Future<TokenEntity> createAccount(UserCredentialDTO user) async {
    token = await _repository.createUserWithEmail(user);
    return token!;
  }

  Future<TokenEntity> loginWithEmail(UserCredentialDTO user) async {
    token = await _repository.loginWithEmail(user);
    return token!;
  }

  Future<void> checkAuth() async {
    token ??= await _repository.checkAuth();

    if (token != null) {
      isAuthenticated = true;
      notifyListeners();
    }
  }

  Future<void> logout() async {
    await _repository.logout();
    isAuthenticated = false;
    notifyListeners();
  }
}

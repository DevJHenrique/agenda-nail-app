import 'package:agenda_nail_app/src/modules/core/authentication/states/auth_state.dart';
import 'package:flutter/foundation.dart';
import 'package:agenda_nail_app/src/modules/auth/dtos/user_credential_dto.dart';

import '../repositories/auth_repository.dart';

class AuthController extends ChangeNotifier {
  final AuthRepository _repository;
  AuthController(this._repository);

  AuthState state = Unauthenticated();

  Future<void> createAccount(UserCredentialDTO user) async {
    state = await _repository.createUserWithEmail(user);
    notifyListeners();
  }

  Future<void> loginWithEmail(UserCredentialDTO user) async {
    state = await _repository.loginWithEmail(user);
    notifyListeners();
  }

  Future<void> checkAuth() async {
    if (state is! Authenticated) {
      state = await _repository.checkAuth();

      notifyListeners();
    }
  }

  Future<void> logout() async {
    state = await _repository.logout();
    notifyListeners();
  }
}

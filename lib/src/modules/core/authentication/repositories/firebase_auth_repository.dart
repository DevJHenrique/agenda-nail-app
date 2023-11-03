import 'package:agenda_nail_app/src/modules/auth/dtos/user_credential_dto.dart';
import 'package:agenda_nail_app/src/modules/core/authentication/states/auth_state.dart';

import '../services/auth_service.dart';
import 'auth_repository.dart';

class FirebaseAuthRepository implements AuthRepository {
  final AuthService service;

  FirebaseAuthRepository(this.service);

  @override
  Future<AuthState> createUserWithEmail(UserCredentialDTO user) async {
    var result = await service.createAccountWithEmail(user);
    var state = result.fold(
      (success) => Authenticated(token: success),
      (failure) => AuthenticationError(error: failure),
    );
    return state;
  }

  @override
  Future<AuthState> checkAuth() async {
    try {
      var token = await service.checkAuth();
      return Authenticated(token: token);
    } catch (e) {
      return AuthenticationError(error: Exception(e));
    }
  }

  @override
  Future<AuthState> logout() async {
    try {
      await service.logout();
      return Unauthenticated();
    } catch (e) {
      return AuthenticationError(error: Exception(e));
    }
  }

  @override
  Future<AuthState> loginWithEmail(UserCredentialDTO user) async {
    var result = await service.loginWithEmailAndPassword(user);
    var state = result.fold(
      (success) => Authenticated(token: success),
      (failure) => AuthenticationError(error: failure),
    );
    return state;
  }
}

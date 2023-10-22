import 'package:agenda_nail_app/src/modules/auth/dtos/user_credential_dto.dart';
import 'package:agenda_nail_app/src/modules/core/authentication/states/auth_state.dart';

abstract class AuthRepository {
  Future<AuthState> createUserWithEmail(UserCredentialDTO user);
  Future<AuthState> loginWithEmail(UserCredentialDTO user);
  Future<AuthState> checkAuth();
  Future<AuthState> logout();
}

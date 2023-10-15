import 'package:agenda_nail_app/src/modules/auth/dtos/user_credential_dto.dart';
import 'package:agenda_nail_app/src/modules/core/models/token_entity.dart';

abstract interface class AuthService {
  Future<TokenEntity?> loginWithEmailAndPassword(UserCredentialDTO user);

  Future<TokenEntity?> createAccountWithEmail(UserCredentialDTO user);

  Future<void> logout();

  Future<TokenEntity?> checkAuth();
}

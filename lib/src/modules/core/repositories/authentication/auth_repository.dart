import 'package:agenda_nail_app/src/modules/auth/dtos/user_credential_dto.dart';
import 'package:agenda_nail_app/src/modules/core/models/token_entity.dart';

abstract class AuthRepository {
  Future<TokenEntity?> createUserWithEmail(UserCredentialDTO user);
  Future<TokenEntity?> loginWithEmail(UserCredentialDTO user);
  Future<TokenEntity?> checkAuth();
  Future<void> logout();
}

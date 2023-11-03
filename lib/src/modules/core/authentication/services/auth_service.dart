import 'package:agenda_nail_app/src/modules/auth/dtos/user_credential_dto.dart';
import 'package:agenda_nail_app/src/modules/core/authentication/exceptions/auth_exception.dart';
import 'package:agenda_nail_app/src/modules/core/authentication/models/token_entity.dart';
import 'package:result_dart/result_dart.dart';

abstract class AuthService {
  AsyncResult<TokenEntity, AuthException> loginWithEmailAndPassword(
      UserCredentialDTO user);

  AsyncResult<TokenEntity, AuthException> createAccountWithEmail(
      UserCredentialDTO user);

  Future<void> logout();

  Future<TokenEntity?> checkAuth();
}

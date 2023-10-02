import 'package:agenda_nail_app/src/modules/auth/dtos/user_credential_dto.dart';
import 'package:agenda_nail_app/src/modules/auth/models/user_model.dart';

abstract interface class AuthService {
  Future<User?> loginWithEmailAndPassword(String email, String password);

  Future<User?> createAccountWithEmail(UserCredentialDTO user);

  Future<void> logout();

  Future<User?> checkAuth();
}

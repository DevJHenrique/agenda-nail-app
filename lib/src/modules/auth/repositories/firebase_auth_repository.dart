import 'package:agenda_nail_app/src/modules/auth/dtos/user_credential_dto.dart';
import 'package:agenda_nail_app/src/modules/auth/models/token_entity.dart';
import 'package:agenda_nail_app/src/modules/auth/repositories/auth_repository.dart';

import '../services/auth_service.dart';

class FirebaseAuthRepository implements AuthRepository {
  final AuthService service;

  FirebaseAuthRepository(this.service);
  @override
  Future<TokenEntity?> createUserWithEmail(UserCredentialDTO user) async {
    var token = await service.createAccountWithEmail(user);
    return token;
  }

  @override
  Future<TokenEntity?> checkAuth() async {
    var token = await service.checkAuth();
    return token;
  }

  @override
  Future<TokenEntity?> loginWithEmail(UserCredentialDTO user) async {
    var token = await service.loginWithEmailAndPassword(user);
    return token;
  }

  @override
  Future<void> logout() async {
    await service.logout();
  }
}

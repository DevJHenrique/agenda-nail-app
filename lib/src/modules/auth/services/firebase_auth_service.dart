import 'package:agenda_nail_app/src/modules/auth/dtos/user_credential_dto.dart';
import 'package:agenda_nail_app/src/modules/auth/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart' as fbAuth;

import 'auth_service.dart';

class FirebaseAuthService implements AuthService {
  final fbAuth.FirebaseAuth auth;

  FirebaseAuthService(this.auth);

  @override
  Future<User?> checkAuth() {
    // TODO: implement checkAuth
    throw UnimplementedError();
  }

  @override
  Future<User?> createAccountWithEmail(UserCredentialDTO user) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: user.email!,
        password: user.password!,
      );
    } catch (e) {
      print(e);
    }
    await auth.currentUser!.updateDisplayName(user.userName);

    return checkAuth();
  }

  @override
  Future<User?> loginWithEmailAndPassword(String email, String password) {
    // TODO: implement loginWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }
}

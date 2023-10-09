import 'package:agenda_nail_app/src/modules/auth/dtos/user_credential_dto.dart';
import 'package:agenda_nail_app/src/modules/auth/models/token_entity.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'auth_service.dart';

class FirebaseAuthService implements AuthService {
  final FirebaseAuth auth;

  FirebaseAuthService(this.auth);

  @override
  Future<TokenEntity?> checkAuth() async {
    TokenEntity token;

    if (auth.currentUser != null) {
      var idToken = await auth.currentUser!.getIdToken();
      var userId = auth.currentUser!.uid;
      var refreshToken = auth.currentUser!.refreshToken;

      token = TokenEntity(idToken!, id: userId, refreshToken: refreshToken);
      return token;
    }
    return null;
  }

  @override
  Future<TokenEntity?> createAccountWithEmail(UserCredentialDTO user) async {
    TokenEntity? token;
    try {
      await auth.createUserWithEmailAndPassword(
        email: user.email!,
        password: user.password!,
      );

      await auth.currentUser!.updateDisplayName(user.userName);
      token = await checkAuth();

      return token;
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<TokenEntity?> loginWithEmailAndPassword(UserCredentialDTO user) async {
    TokenEntity? token;
    try {
      await auth.signInWithEmailAndPassword(
        email: user.email!,
        password: user.password!,
      );

      token = await checkAuth();
      return token;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> logout() async {
    await auth.signOut();
  }
}

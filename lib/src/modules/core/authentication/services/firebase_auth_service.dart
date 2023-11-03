import 'package:agenda_nail_app/src/modules/auth/dtos/user_credential_dto.dart';
import 'package:agenda_nail_app/src/modules/core/authentication/exceptions/auth_exception.dart';
import 'package:agenda_nail_app/src/modules/core/authentication/models/token_entity.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:result_dart/result_dart.dart';

import 'auth_service.dart';

class FirebaseAuthService implements AuthService {
  final FirebaseAuth auth;

  FirebaseAuthService(this.auth);

  @override
  Future<TokenEntity?> checkAuth() async {
    TokenEntity token;

    var currentUser = auth.currentUser;

    try {
      if (currentUser != null) {
        var idToken = await currentUser.getIdToken();
        var userId = currentUser.uid;
        var refreshToken = currentUser.refreshToken;

        token = TokenEntity(idToken!, id: userId, refreshToken: refreshToken);
        return token;
      }
    } catch (e) {
      throw Exception(e);
    }
    throw Exception('Usuário não autenticado!');
  }

  @override
  AsyncResult<TokenEntity, AuthException> createAccountWithEmail(
      UserCredentialDTO user) async {
    UserCredential credential;
    try {
      credential = await auth.createUserWithEmailAndPassword(
        email: user.email!,
        password: user.password!,
      );
      await credential.user!.updateDisplayName(user.userName);

      var token = await getToken(credential);

      return Success(token);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return WrongPasswordException(trace: e.stackTrace).toFailure();
      } else if (e.code == 'invalid-email') {
        return InvalidEmailException(trace: e.stackTrace).toFailure();
      } else if (e.code == 'weak-password') {
        return UserDisabledException(trace: e.stackTrace).toFailure();
      }
    } catch (e) {
      return CreateAccountException('CreateAccountException $e').toFailure();
    }
    return CreateAccountException('Ocorreu um erro inesperado').toFailure();
  }

  @override
  AsyncResult<TokenEntity, AuthException> loginWithEmailAndPassword(
      UserCredentialDTO user) async {
    UserCredential credential;
    try {
      credential = await auth.signInWithEmailAndPassword(
        email: user.email!,
        password: user.password!,
      );

      var token = await getToken(credential);

      return Success(token);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'wrong-password') {
        return WrongPasswordException(trace: e.stackTrace).toFailure();
      } else if (e.code == 'invalid-email') {
        return InvalidEmailException(trace: e.stackTrace).toFailure();
      } else if (e.code == 'user-disabled') {
        return UserDisabledException(trace: e.stackTrace).toFailure();
      } else if (e.code == 'user-not-found') {
        return UserNotFoundException(trace: e.stackTrace).toFailure();
      }
    } catch (e) {
      return LoginException('$e').toFailure();
    }
    return LoginException('Ocorreu um erro inesperado').toFailure();
  }

  @override
  Future<void> logout() async {
    await auth.signOut();
  }

  Future<TokenEntity> getToken(UserCredential userCredential) async {
    var idToken = await userCredential.user!.getIdToken();
    var userId = userCredential.user!.uid;
    var refreshToken = userCredential.user!.refreshToken;

    var token = TokenEntity(idToken!, id: userId, refreshToken: refreshToken);
    return token;
  }
}

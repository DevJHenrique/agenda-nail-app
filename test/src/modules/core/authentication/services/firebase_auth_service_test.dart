import 'package:agenda_nail_app/src/modules/auth/dtos/user_credential_dto.dart';
import 'package:agenda_nail_app/src/modules/core/authentication/models/token_entity.dart';
import 'package:agenda_nail_app/src/modules/core/authentication/services/auth_service.dart';
import 'package:agenda_nail_app/src/modules/core/authentication/services/firebase_auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class FirebaseAuthMock extends Mock implements FirebaseAuth {}

class UserCredentialMock extends Mock implements UserCredential {}

class UserMock extends Mock implements User {}

void main() {
  late FirebaseAuthMock authMock = FirebaseAuthMock();

  late AuthService service = FirebaseAuthService(FirebaseAuthMock());
  late UserCredentialMock userCredentialMock = UserCredentialMock();
  late UserMock userMock = UserMock();

  setUp(() {
    authMock = FirebaseAuthMock();
    userCredentialMock = UserCredentialMock();
    userMock = UserMock();
    service = FirebaseAuthService(authMock);
  });
  tearDown(() => reset(authMock));

  group('loginWithEmailAndPassword |', () {
    var user =
        UserCredentialDTO(email: 'jhsilva149@gmail.com', password: '123456');
    test(
      'Deve retornar um Success com TokenEntity ',
      () async {
        when(() => authMock.signInWithEmailAndPassword(
              email: user.email!,
              password: user.password!,
            )).thenAnswer((_) async => userCredentialMock);

        when(() => userCredentialMock.user).thenReturn(userMock);
        var userCredential = userCredentialMock.user!;

        when(() => userCredential.getIdToken()).thenAnswer((_) async =>
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c');

        when(() => userCredential.uid)
            .thenReturn('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9');

        when(() => userCredential.refreshToken)
            .thenReturn('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9');

        var result = await service.loginWithEmailAndPassword(user);
        var token = result.getOrThrow();
        expect(result.isSuccess(), true);
        expect(token, isA<TokenEntity>());
      },
    );
  });
  group('createAccountWithEmail | ', () {});
  group('checkAuth | ', () {});
  group('logout | ', () {});
}

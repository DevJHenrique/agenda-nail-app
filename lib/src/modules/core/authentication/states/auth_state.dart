import 'package:agenda_nail_app/src/modules/core/authentication/models/token_entity.dart';

sealed class AuthState {
  final TokenEntity? token;
  final Exception? error;

  AuthState({this.token, this.error});
}

class Unauthenticated extends AuthState {
  Unauthenticated({super.token, super.error});
}

class Authenticated extends AuthState {
  Authenticated({required super.token});
}

class AuthenticationError extends AuthState {
  AuthenticationError({required super.error});
}

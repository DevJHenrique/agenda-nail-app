abstract class AuthException implements Exception {
  final String message;
  final StackTrace? trace;

  AuthException(this.message, {this.trace});
}

class LoginException extends AuthException {
  LoginException(super.message, {super.trace});
}

class CreateAccountException extends AuthException {
  CreateAccountException(super.message, {super.trace});
}

class WrongPasswordException extends AuthException {
  WrongPasswordException({super.trace}) : super('Email ou senha inválidos');
}

class InvalidEmailException extends AuthException {
  InvalidEmailException({super.trace}) : super('Email inválido');
}

class UserDisabledException extends AuthException {
  UserDisabledException({super.trace}) : super('Conta desativada');
}

class UserNotFoundException extends AuthException {
  UserNotFoundException({super.trace}) : super('Email ou senha inválidos');
}

class EmailAlreadyInUseException extends AuthException {
  EmailAlreadyInUseException({super.trace}) : super('Email já cadastrado');
}

class WeakPasswordException extends AuthException {
  WeakPasswordException({super.trace}) : super('Senha muito fraca');
}

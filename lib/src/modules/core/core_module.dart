import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'authentication/controllers/auth_controller.dart';
import 'authentication/repositories/auth_repository.dart';
import 'authentication/repositories/firebase_auth_repository.dart';
import 'authentication/services/auth_service.dart';
import 'authentication/services/firebase_auth_service.dart';

class CoreModule extends Module {
  @override
  void exportedBinds(Injector i) {
    i.addSingleton(AuthController.new);
    i.addInstance(FirebaseAuth.instance);
    i.add<AuthRepository>(FirebaseAuthRepository.new);
    i.add<AuthService>(FirebaseAuthService.new);
  }
}

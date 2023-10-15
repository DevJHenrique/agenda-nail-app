import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'controllers/auth_controller.dart';
import 'repositories/authentication/auth_repository.dart';
import 'repositories/authentication/firebase_auth_repository.dart';
import 'services/authentication/auth_service.dart';
import 'services/authentication/firebase_auth_service.dart';

class CoreModule extends Module {
  @override
  void exportedBinds(Injector i) {
    i.addSingleton(AuthController.new);
    i.addInstance(FirebaseAuth.instance);
    i.add<AuthRepository>(FirebaseAuthRepository.new);
    i.add<AuthService>(FirebaseAuthService.new);
  }
}

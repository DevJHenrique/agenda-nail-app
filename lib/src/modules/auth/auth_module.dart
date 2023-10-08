import 'package:agenda_nail_app/src/modules/auth/controller/auth_controller.dart';
import 'package:agenda_nail_app/src/modules/auth/controller/create_account_controller.dart';
import 'package:agenda_nail_app/src/modules/auth/controller/login_controller.dart';
import 'package:agenda_nail_app/src/modules/auth/pages/create_account_page.dart';
import 'package:agenda_nail_app/src/modules/auth/pages/login_page.dart';
import 'package:agenda_nail_app/src/modules/auth/repositories/auth_repository.dart';
import 'package:agenda_nail_app/src/modules/auth/repositories/firebase_auth_repository.dart';
import 'package:agenda_nail_app/src/modules/auth/services/auth_service.dart';
import 'package:agenda_nail_app/src/modules/auth/services/firebase_auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthModule extends Module {
  @override
  void binds(Injector i) {
    //i.addSingleton(AuthController.new);
  }

  @override
  void exportedBinds(Injector i) {
    i.addSingleton(AuthController.new);
    i.addSingleton(CreateAccountController.new);
    i.addSingleton(LoginController.new);
    i.addInstance(FirebaseAuth.instance);
    i.add<AuthService>(FirebaseAuthService.new);
    i.add<AuthRepository>(FirebaseAuthRepository.new);
  }

  @override
  void routes(RouteManager r) {
    r.child('/new', child: (context) => const CreateAccountPage());
    r.child('/', child: (context) => const LoginPage());
  }
}

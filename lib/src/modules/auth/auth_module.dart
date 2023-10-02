import 'package:agenda_nail_app/src/modules/auth/controller/auth_controller.dart';
import 'package:agenda_nail_app/src/modules/auth/pages/auth_page.dart';
import 'package:agenda_nail_app/src/modules/auth/services/auth_service.dart';
import 'package:agenda_nail_app/src/modules/auth/services/firebase_auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthModule extends Module {
  @override
  void binds(Injector i) {}

  @override
  void exportedBinds(Injector i) {
    i.addInstance(FirebaseAuth.instance);
    i.addSingleton(AuthController.new);
    i.add<AuthService>(FirebaseAuthService.new);
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => const AuthPage());
  }
}

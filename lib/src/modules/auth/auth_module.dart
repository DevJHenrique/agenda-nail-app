import 'package:agenda_nail_app/src/modules/auth/controller/auth_controller.dart';
import 'package:agenda_nail_app/src/modules/auth/pages/auth_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthModule extends Module {
  @override
  void binds(Injector i) {
    i.addSingleton(AuthController.new);
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => const AuthPage());
  }
}

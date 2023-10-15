import 'package:agenda_nail_app/src/modules/auth/controller/create_account_controller.dart';
import 'package:agenda_nail_app/src/modules/auth/controller/login_controller.dart';
import 'package:agenda_nail_app/src/modules/auth/pages/create_account_page.dart';
import 'package:agenda_nail_app/src/modules/auth/pages/login_page.dart';
import 'package:agenda_nail_app/src/modules/core/core_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthModule extends Module {
  @override
  void binds(Injector i) {
    i.addSingleton(CreateAccountController.new);
    i.addSingleton(LoginController.new);
  }

  @override
  List<Module> get imports => [
        CoreModule(),
      ];

  @override
  void routes(RouteManager r) {
    r.child('/new', child: (context) => const CreateAccountPage());
    r.child('/', child: (context) => const LoginPage());
  }
}

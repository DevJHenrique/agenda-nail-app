import 'package:agenda_nail_app/src/modules/auth/auth_module.dart';
import 'package:agenda_nail_app/src/modules/core/core_module.dart';
import 'package:agenda_nail_app/src/modules/home/home_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  void binds(i) {}

  @override
  List<Module> get imports => [
        CoreModule(),
      ];

  @override
  void routes(r) {
    r.redirect('/', to: '/home/');
    r.module('/home', module: HomeModule());
    r.module('/auth', module: AuthModule());
  }
}

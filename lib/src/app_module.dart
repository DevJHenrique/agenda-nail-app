import 'package:agenda_nail_app/src/modules/auth/auth_module.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  void binds(i) {}

  @override
  // TODO: implement imports
  List<Module> get imports => [
        AuthModule(),
      ];

  @override
  void routes(r) {
    r.redirect('/', to: '/home/');
    r.module('/home', module: HomeModule());
    r.module('/auth', module: AuthModule());
  }
}

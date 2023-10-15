import 'package:flutter_modular/flutter_modular.dart';
import 'package:agenda_nail_app/src/modules/core/core_module.dart';

import 'controllers/home_controller.dart';
import 'pages/home_page.dart';
import 'pages/scheduling_page.dart';

class HomeModule extends Module {
  @override
  void binds(Injector i) {
    i.addSingleton(HomeController.new);
  }

  @override
  List<Module> get imports => [CoreModule()];

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (context) => HomePage(Modular.get<HomeController>()),
    );
    r.child(
      '/agendamento',
      child: (context) => const SchedulingPage(),
    );
  }
}

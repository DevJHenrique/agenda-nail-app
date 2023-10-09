import 'package:agenda_nail_app/src/modules/auth/auth_module.dart';
import 'package:agenda_nail_app/src/modules/home/controllers/home_controller.dart';
import 'package:agenda_nail_app/src/modules/home/pages/home_page.dart';
import 'package:agenda_nail_app/src/modules/home/pages/scheduling_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  void binds(Injector i) {
    i.addSingleton(HomeController.new);
  }

  @override
  List<Module> get imports => [AuthModule()];

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

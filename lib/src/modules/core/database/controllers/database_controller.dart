import 'package:agenda_nail_app/src/modules/core/database/models/user_model.dart';
import 'package:agenda_nail_app/src/modules/core/database/services/database_service.dart';

class DatabaseController {
  final DatabaseService service;

  DatabaseController(this.service);

  Future<void> setUser(UserModel user) async {
    await service.setUser(user);
  }
}

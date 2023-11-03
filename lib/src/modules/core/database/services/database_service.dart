import '../models/user_model.dart';

abstract class DatabaseService {
  Future<void> add(UserModel user);
}

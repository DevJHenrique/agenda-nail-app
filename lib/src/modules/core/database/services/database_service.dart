import '../models/user_model.dart';

abstract class DatabaseService {
  Future<void> setUser(UserModel user);
  Future<void> deleteUser(UserModel user);
}

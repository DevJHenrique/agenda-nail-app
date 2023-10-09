import 'package:agenda_nail_app/src/modules/auth/controller/auth_controller.dart';
import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  final AuthController _authController;
  int? selectedIndex;

  HomeController(this._authController);

  void select(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  Future<void> checkAuth() async {
    await _authController.checkAuth();
    notifyListeners();
  }

  Future<void> logout() async {
    await _authController.logout();
    notifyListeners();
  }

  bool get isAuthenticated => _authController.isAuthenticated;
}

import 'package:flutter/material.dart';
import 'package:agenda_nail_app/src/modules/core/controllers/auth_controller.dart';

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

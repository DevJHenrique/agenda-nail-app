import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  int? selectedIndex;

  void select(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}

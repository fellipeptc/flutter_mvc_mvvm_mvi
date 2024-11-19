import 'package:flutter/material.dart';

class HomeModel extends ChangeNotifier {
  final List<String> _names = [];

  List<String> get names => _names;

  void addName(String name) {
    _names.add(name);
    notifyListeners();
  }

  void removeName(String name) {
    _names.remove(name);
    notifyListeners();
  }

  void removeAll() {
    _names.clear();
    notifyListeners();
  }
}

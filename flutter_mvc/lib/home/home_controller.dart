import 'package:flutter_mvc/home/home_model.dart';

class HomeController {
  final HomeModel _model;

  HomeController(this._model);

  List<String> get names => _model.names;

  void addName(String name) => _model.addName(name);

  void removeName(String name) => _model.removeName(name);

  void removeAll() => _model.removeAll();
}

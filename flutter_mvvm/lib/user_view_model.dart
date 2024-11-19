import 'package:flutter/material.dart';
import 'package:flutter_mvvm/user_model.dart';

class UserViewModel extends ChangeNotifier {
  UserModel _user = UserModel(name: "John Doe", email: "john.doe@example.com");

  UserModel get user => _user;

  void updateUser(String name, String email) {
    _user = UserModel(name: name, email: email);
    // Notifica a View para atualizar
    notifyListeners(); 
  }
}
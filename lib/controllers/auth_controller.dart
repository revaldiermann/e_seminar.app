import 'package:flutter/material.dart';

class AuthController extends ChangeNotifier {
  bool isLogin = false;
  String username = "";

  bool login(String user, String password) {
    if (user.isNotEmpty && password.length >= 6) {
      username = user;
      isLogin = true;
      notifyListeners();
      return true;
    }
    return false;
  }

  void logout() {
    isLogin = false;
    username = "";
    notifyListeners();
  }
}

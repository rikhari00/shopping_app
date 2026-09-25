import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String _userName = "";
  String _email = "";

  String get userName => _userName;

  String get email => _email;

  void setUserDetails(String name, String userEmail) {
    _userName = name;
    _email = userEmail;
    notifyListeners();
  }
}


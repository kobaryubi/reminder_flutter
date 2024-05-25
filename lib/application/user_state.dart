import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserState extends ChangeNotifier {
  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;

  UserState() {
    init();
  }

  void init() {
    FirebaseAuth.instance.userChanges().listen((user) {
      _isLoggedIn = user != null;
      notifyListeners();
    });
  }
}

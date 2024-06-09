import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserState extends ChangeNotifier {
  User? _user = FirebaseAuth.instance.currentUser;
  User? get user => _user;

  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;

  UserState() {
    init();
  }

  void init() {
    FirebaseAuth.instance.userChanges().listen((user) {
      _isLoggedIn = user != null && user.emailVerified;
      _user = user;

      notifyListeners();
    });
  }
}

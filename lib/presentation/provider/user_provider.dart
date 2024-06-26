import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_provider.g.dart';

@riverpod
class User extends _$User {
  @override
  firebase_auth.User? build() {
    firebase_auth.FirebaseAuth.instance.userChanges().listen((user) {
      state = user;
    });

    return firebase_auth.FirebaseAuth.instance.currentUser;
  }
}

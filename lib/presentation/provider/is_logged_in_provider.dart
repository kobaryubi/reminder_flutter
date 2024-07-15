import 'package:reminder_flutter/presentation/provider/user_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'is_logged_in_provider.g.dart';

@riverpod
bool isLoggedIn(IsLoggedInRef ref) {
  return ref.watch(userProvider) != null;
}

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reminder_flutter/application/reminder_state.dart';
import 'package:reminder_flutter/application/user_state.dart';
import 'package:reminder_flutter/firebase_options.dart';
import 'package:reminder_flutter/presentation/router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseUIAuth.configureProviders([
    EmailAuthProvider(),
  ]);

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ReminderState>(
          create: (context) => ReminderState(),
        ),
        ChangeNotifierProvider<UserState>(
          create: (context) => UserState(),
        )
      ],
      child: MaterialApp.router(
        routerConfig: router,
      ),
    );
  }
}

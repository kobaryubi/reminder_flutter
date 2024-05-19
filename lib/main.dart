import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reminder_flutter/firebase_options.dart';
import 'package:reminder_flutter/model/reminder_model.dart';
import 'package:reminder_flutter/view/reminder_list_view.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ReminderModel(),
      child: const MaterialApp(
        home: ReminderListView(),
      ),
    );
  }
}

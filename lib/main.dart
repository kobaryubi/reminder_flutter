import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/reminder_model.dart';
import 'screens/reminder_list.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ReminderModel(),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ReminderListScreen(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/reminder_model.dart';

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
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          children: const <Widget>[
            ListTile(
              leading: Icon(Icons.alarm),
              title: Text("10:00"),
            ),
          ],
        ),
      ),
    );
  }
}

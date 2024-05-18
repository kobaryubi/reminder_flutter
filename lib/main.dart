import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reminder_flutter/model/reminder_model.dart';
import 'package:reminder_flutter/view/reminder_list_view.dart';

void main() {
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

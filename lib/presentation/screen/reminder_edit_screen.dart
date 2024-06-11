import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reminder_flutter/application/use_case/reminder/get_reminder_use_case.dart';
import 'package:reminder_flutter/domain/entity/reminder_entity.dart';
import 'package:reminder_flutter/presentation/state/user_state.dart';
import 'package:reminder_flutter/presentation/widget/reminder_edit_form_widget.dart';

class ReminderEditScreen extends StatefulWidget {
  final String? id;

  const ReminderEditScreen({super.key, this.id});

  @override
  State<ReminderEditScreen> createState() => _ReminderEditScreenState();
}

class _ReminderEditScreenState extends State<ReminderEditScreen> {
  late Future<ReminderEntity> futureReminderEntity;

  @override
  void initState() {
    super.initState();

    final uid = context.read<UserState>().user?.uid;
    final id = widget.id;

    if (uid == null || id == null) {
      futureReminderEntity = Future.value(ReminderEntity(
        id: '',
        title: '',
        remindAt: DateTime.now(),
      ));

      return;
    }

    futureReminderEntity = context.read<GetReminderUseCase>()(
      uid: uid,
      id: id,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Reminder'),
      ),
      body: FutureBuilder(
        future: futureReminderEntity,
        builder:
            (BuildContext context, AsyncSnapshot<ReminderEntity> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          return ReminderEditFormWidget(reminderEntity: snapshot.data!);
        },
      ),
    );
  }
}

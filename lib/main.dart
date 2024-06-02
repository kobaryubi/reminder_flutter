import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reminder_flutter/presentation/state/reminder_list_state.dart';
import 'package:reminder_flutter/application/service/reminder_service.dart';
import 'package:reminder_flutter/application/usecase/reminder/get_reminders_usecase.dart';
import 'package:reminder_flutter/application/user_state.dart';
import 'package:reminder_flutter/firebase_options.dart';
import 'package:reminder_flutter/infrastructure/repository_impl/rest_reminder_repository_impl.dart';
import 'package:reminder_flutter/presentation/router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseUIAuth.configureProviders([
    EmailAuthProvider(),
  ]);

  final reminderRepository =
      RestReminderRepositoryImpl("http://localhost:8080");
  final reminderService = ReminderService(reminderRepository);

  runApp(MainApp(
    reminderService: reminderService,
  ));
}

class MainApp extends StatelessWidget {
  final ReminderService _reminderService;

  const MainApp({super.key, required ReminderService reminderService})
      : _reminderService = reminderService;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserState>(
          create: (context) => UserState(),
        ),
        Provider<GetRemindersUseCase>(
          create: (BuildContext context) =>
              GetRemindersUseCase(_reminderService),
        ),
        ChangeNotifierProvider<ReminderListState>(
          create: (BuildContext context) =>
              ReminderListState(context.read<GetRemindersUseCase>()),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: router,
      ),
    );
  }
}

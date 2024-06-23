import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:provider/provider.dart';
import 'package:reminder_flutter/application/use_case/reminder/add_reminder_use_case.dart';
import 'package:reminder_flutter/application/use_case/reminder/delete_reminder_use_case.dart';
import 'package:reminder_flutter/application/use_case/reminder/get_reminder_use_case.dart';
import 'package:reminder_flutter/application/use_case/reminder/update_reminder_use_case.dart';
import 'package:reminder_flutter/infrastructure/repository_impl/firestore_reminder_repository_impl.dart';
import 'package:reminder_flutter/presentation/state/reminder_list_state.dart';
import 'package:reminder_flutter/application/service/reminder_service.dart';
import 'package:reminder_flutter/application/use_case/reminder/get_reminders_use_case.dart';
import 'package:reminder_flutter/presentation/state/user_state.dart';
import 'package:reminder_flutter/firebase_options.dart';
import 'package:reminder_flutter/presentation/router.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseUIAuth.configureProviders([
    EmailAuthProvider(),
  ]);

  final reminderRepository =
      FirestoreReminderRepositoryImpl(FirebaseFirestore.instance);
  final reminderService = ReminderService(reminderRepository);

  tz.initializeTimeZones();
  final timeZoneName = await FlutterTimezone.getLocalTimezone();
  final location = tz.getLocation(timeZoneName);
  tz.setLocalLocation(location);

  const initializationSettingsDarwin = DarwinInitializationSettings(
    requestAlertPermission: true,
  );
  const initializationSettings = InitializationSettings(
    iOS: initializationSettingsDarwin,
  );
  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
  );

  runApp(
    MainApp(
      reminderService: reminderService,
      getRemindersUseCase: GetRemindersUseCase(reminderService),
      getReminderUseCase:
          GetReminderUseCase(reminderRepository: reminderRepository),
      deleteReminderUseCase: DeleteReminderUseCase(
        reminderRepository: reminderRepository,
      ),
    ),
  );
}

class MainApp extends StatelessWidget {
  final ReminderService _reminderService;
  final GetRemindersUseCase getRemindersUseCase;
  final GetReminderUseCase getReminderUseCase;
  final DeleteReminderUseCase deleteReminderUseCase;

  const MainApp({
    super.key,
    required this.getRemindersUseCase,
    required this.getReminderUseCase,
    required this.deleteReminderUseCase,
    required ReminderService reminderService,
  }) : _reminderService = reminderService;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserState>(
          create: (context) => UserState(),
        ),
        Provider<GetReminderUseCase>(
          create: (BuildContext context) => getReminderUseCase,
        ),
        Provider<AddReminderUseCase>(
          create: (BuildContext context) =>
              AddReminderUseCase(_reminderService),
        ),
        Provider<UpdateReminderUseCase>(
          create: (BuildContext context) =>
              UpdateReminderUseCase(reminderService: _reminderService),
        ),
        ChangeNotifierProxyProvider<UserState, ReminderListState>(
          create: (BuildContext context) {
            return ReminderListState(
              getRemindersUseCase: getRemindersUseCase,
              deleteReminderUseCase: deleteReminderUseCase,
              userState: context.read<UserState>(),
            );
          },
          update: (
            BuildContext context,
            UserState userState,
            ReminderListState? reminderListState,
          ) {
            return ReminderListState(
              getRemindersUseCase: getRemindersUseCase,
              deleteReminderUseCase: deleteReminderUseCase,
              userState: userState,
            );
          },
        ),
      ],
      child: MaterialApp.router(
        routerConfig: router,
      ),
    );
  }
}

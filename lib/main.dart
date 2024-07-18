import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reminder_flutter/firebase_options.dart';
import 'package:reminder_flutter/presentation/provider/router_provider.dart';
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

  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    if (kReleaseMode) {
      exit(1);
    }
  };

  PlatformDispatcher.instance.onError = (error, stack) {
    return true;
  };

  runApp(
    const ProviderScope(
      child: MainApp(),
    ),
  );
}

class MainApp extends HookConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = ColorScheme.fromSeed(seedColor: Colors.lightBlue);
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      routerConfig: router,
      theme: ThemeData(
        colorScheme: colorScheme,
        appBarTheme: AppBarTheme(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
        ),
      ),
    );
  }
}

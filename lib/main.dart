import 'package:aql_app/providers/examresults_provider.dart';
import 'package:aql_app/providers/signin_provider.dart';
import 'package:aql_app/providers/streams_provider.dart';
import 'package:aql_app/screens/notifs/noti_service.dart';
import 'package:aql_app/splash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await NotiService().initNotification();
  } catch (e, st) {
    debugPrint('Notification init failed: $e');
    debugPrint('$st');
  }

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SignInProvider()),
        ChangeNotifierProvider(create: (_) => StreamsProvider()),
        ChangeNotifierProvider(create: (_) => ExamResultProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, fontFamily: 'Manrope'),
      home: const SplashScreen(),
    );
  }
}

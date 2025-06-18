import 'package:aql_app/constants/global_variables.dart';
import 'package:aql_app/nav.dart';
import 'package:aql_app/providers/signin_provider.dart';
import 'package:aql_app/screens/signin.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StartupScreen extends StatefulWidget {
  const StartupScreen({super.key});

  @override
  State<StartupScreen> createState() => _StartupScreenState();
}

class _StartupScreenState extends State<StartupScreen> {
  @override
  void initState() {
    super.initState();
    checkAuth();
  }

  Future<void> checkAuth() async {
    await sharedPref();

    final provider = Provider.of<SignInProvider>(context, listen: false);
    await provider.loadFromPrefs();

    if (provider.userToken.isNotEmpty) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const BottomNav()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const Signin()),
      );
    }
  }

  Future<void> sharedPref() async {
    final prefs = await SharedPreferences.getInstance();
    final username = prefs.getString('userName') ?? '';
    final email = prefs.getString('userEmail') ?? '';

    debugPrint('Username: $username');
    debugPrint('Email: $email');
    debugPrint(SignInProvider.baseUrl);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}

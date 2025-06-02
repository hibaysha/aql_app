import 'package:aql_app/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<SignInProvider>(
        builder: (context, provider, _) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('${provider.userName}'),
                Text('${provider.userEmail}'),
                Text('${provider.userStudent}'),
              ],
            ),
          );
        },
      ),
    );
  }
}

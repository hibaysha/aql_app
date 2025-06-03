import 'package:aql_app/core_components/dx_app_bar.dart';
import 'package:aql_app/screens/next_page/widget/profile.dart';
import 'package:flutter/material.dart';

class NextPage extends StatefulWidget {
  const NextPage({super.key});

  @override
  State<NextPage> createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DxAppBar(title: 'home'),
      body: Center(
        child: Column(
          children: [Profile(title: 'helloooo', subtitle: 'hiiii')],
        ),
      ),
    );
  }
}

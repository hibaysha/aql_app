import 'package:aql_app/constants/dx_icons.dart';
import 'package:aql_app/core_components/dx_icon.dart';
import 'package:aql_app/core_components/dx_text.dart';
import 'package:aql_app/nav.dart';
import 'package:flutter/material.dart';

class TheAppBr extends StatelessWidget {
  final String text;

  const TheAppBr({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (context) => BottomNav()));
        },
        icon: DxIcon(DxIcons.back),
      ),

      title: DxText(text: text, type: DxTextType.h3),
      centerTitle: false,
    );
  }
}

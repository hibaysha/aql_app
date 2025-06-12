import 'package:aql_app/core_components/constants/dx_colors.dart';
import 'package:aql_app/core_components/dx_text.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  final String title;
  final String subtitle;

  const Profile({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DxText(text: title, type: DxTextType.h1, color: DxColors.black),
          DxText(
            text: subtitle,
            type: DxTextType.h6,
            color: DxColors.neutral600,
          ),
        ],
      ),
    );
  }
}

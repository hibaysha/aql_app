import 'package:aql_app/core_components/constants/dx_colors.dart';
import 'package:aql_app/core_components/dx_text.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  final String title;
  final String subtitle;

  const Profile({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: DxColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          DxText(text: title, type: DxTextType.h1, color: DxColors.stateAway),
          DxText(
            text: subtitle,
            type: DxTextType.h5,
            color: DxColors.stateFeature,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../core_components/constants/dx_colors.dart';
import '../constants/dx_images.dart';

class ScaffoldBG extends StatelessWidget {
  final Scaffold scaffold;
  final bool isOnboarding;

  const ScaffoldBG({
    super.key,
    required this.scaffold,
    this.isOnboarding = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: DxColors.white,
        image: DecorationImage(
          image: isOnboarding ? AssetImage(DxImages.onboarding1) : AssetImage(DxImages.scaffoldOverlay),
          fit: BoxFit.cover,
        ),
      ),
      child: scaffold,
    );
  }
} 
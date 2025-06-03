import 'package:flutter/material.dart';
import 'dart:ui';
import 'constants/dx_colors.dart';
import 'constants/dx_text_styles.dart';
import 'dx_icon.dart';

class DxBottomNavigation extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onIndexChanged;

  const DxBottomNavigation({
    super.key,
    required this.selectedIndex,
    required this.onIndexChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 28.8,
          sigmaY: 28.8,
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: Alignment.center,
              radius: 2.0,
              colors: [
                const Color(0xFF737B73).withOpacity(0.4),
                const Color(0xFF4D504D).withOpacity(0.4),
                const Color(0xFF1E1E1E).withOpacity(0.4),
              ],
              stops: const [0.0, 0.5, 1.0],
              tileMode: TileMode.clamp,
            ),
            border: Border(
              top: BorderSide(color: DxColors.primary.withOpacity(0.46),width: 0.5),
            ),
            borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
          ),
          child: SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildNavItem(
                    index: 0,
                    icon: 'assets/icons/home.svg',
                    label: 'Home',
                    isSelected: selectedIndex == 0,
                  ),
                  _buildNavItem(
                    index: 1,
                    icon: 'assets/icons/module.svg',
                    label: 'Module',
                    isSelected: selectedIndex == 1,
                  ),
                  _buildNavItem(
                    index: 2,
                    icon: 'assets/icons/activities.svg',
                    label: 'Activities',
                    isSelected: selectedIndex == 2,
                  ),
                  _buildNavItem(
                    index: 3,
                    icon: 'assets/icons/updates.svg',
                    label: 'Updates',
                    isSelected: selectedIndex == 3,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required int index,
    required String icon,
    required String label,
    required bool isSelected,
  }) {
    return InkWell(
      onTap: () => onIndexChanged(index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DxIcon(
              icon,
              size: 24,
              color: isSelected ? DxColors.primary : DxColors.neutral400,
            ),
           
            const SizedBox(height: 4),
            Text(
              label,
              style: DxTextStyles.primaryFont500(
                12,
                isSelected ? DxColors.primary : DxColors.neutral400,
              ),
            ),
          ],
        ),
      ),
    );
  }
} 
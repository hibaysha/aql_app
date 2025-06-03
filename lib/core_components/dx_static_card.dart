import 'package:flutter/material.dart';
import 'constants/dx_colors.dart';
import '../core_components/dx_text.dart';

class DxStaticCard extends StatelessWidget {
  final String title;
  final int count;
  final int totalCount;
  final Color indicatorColor;
  final Color backgroundColor;
  final Color progressBackgroundColor;

  const DxStaticCard({
    super.key,
    required this.title,
    required this.count,
    required this.totalCount,
    this.indicatorColor = DxColors.primary,
    this.backgroundColor = DxColors.secondary,
    this.progressBackgroundColor = DxColors.black,
  });

  double get percentage => totalCount > 0 ? count / totalCount : 0;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final progressSize = screenWidth * 0.25; // 25% of screen width

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: indicatorColor,
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: 8),
              DxText(
                text: title,
                type: DxTextType.overline,
              ),
              Spacer(),
              DxText(
                text: count.toString(),
                type: DxTextType.h1,
              ),
            ],
          ),
          SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: progressSize,
                height: progressSize,
                child: Stack(
                  children: [
                    Center(
                      child: Container(
                        width: progressSize,
                        height: progressSize,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: indicatorColor.withAlpha(50),
                        ),
                        child: CircularProgressIndicator(
                          strokeCap: StrokeCap.round,
                          padding: EdgeInsets.all(4),
                          value: percentage,
                          color: indicatorColor,
                          strokeWidth: 8,
                        ),
                      ),
                    ),
                    Center(
                      child: DxText(
                        text: "${(percentage * 100).toInt()}%",
                        type: DxTextType.h3,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
} 
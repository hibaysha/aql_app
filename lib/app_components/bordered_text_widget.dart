import 'package:flutter/material.dart';
import '../core_components/constants/dx_colors.dart';
import '../core_components/dx_text.dart';

class BorderedTextWidget extends StatelessWidget {
  final String text;
  final DxTextType textType;
  final Color? textColor;
  final Color? borderColor;
  final double borderWidth;
  final double borderRadius;
  final EdgeInsetsGeometry padding;

  const BorderedTextWidget({
    super.key,
    required this.text,
    this.textType = DxTextType.overline,
    this.textColor = DxColors.white,
    this.borderColor = DxColors.white,
    this.borderWidth = 0.5,
    this.borderRadius = 10,
    this.padding = const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: borderColor!, width: borderWidth),
      ),
      child: DxText(
        '', // Add empty string as first positional argument
        text: text,
        type: textType,
        color: textColor,
      ),
    );
  }
}

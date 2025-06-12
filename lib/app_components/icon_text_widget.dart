import 'package:flutter/material.dart';
import '../core_components/constants/dx_colors.dart';
import '../constants/dx_icons.dart';
import '../core_components/dx_icon.dart';
import '../core_components/dx_text.dart';

class IconTextWidget extends StatelessWidget {
  final String? text;
  final String icon;
  final Color? iconColor;
  final double? iconSize;
  final DxTextType textType;
  final Color? textColor;
  final double spacing;

  const IconTextWidget({
    super.key,
    this.text,
    this.icon = DxIcons.edit,
    this.iconColor = DxColors.white,
    this.iconSize = 20,
    this.textType = DxTextType.overline,
    this.textColor = DxColors.white,
    this.spacing = 10,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        DxIcon(icon, color: iconColor, size: iconSize),
        SizedBox(width: spacing),
        DxText(
          text ?? '',
          text: text ?? '',
          type: textType,
          color: textColor,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ],
    );
  }
}

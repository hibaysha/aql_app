import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DxIcon extends StatelessWidget {
  final String icon;
  final double? size;
  final Color? color;
  final BoxFit fit;
  final AlignmentGeometry alignment;
  final bool allowDrawingOutsideViewBox;
  final String? semanticsLabel;

  const DxIcon(
    this.icon, {
    super.key,
    this.size,
    this.color,
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
    this.allowDrawingOutsideViewBox = false,
    this.semanticsLabel,
  });

  @override
  Widget build(BuildContext context) {
    if (icon.endsWith('.svg')) {
      return SvgPicture.asset(
        icon,
        width: size,
        height: size,
        colorFilter: color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
        fit: fit,
        alignment: alignment,
        allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
        semanticsLabel: semanticsLabel,
      );
    }

    // For non-SVG (regular image assets)
    return Image.asset(
      icon,
      width: size,
      height: size,
      color: color,
      fit: fit,
      alignment: alignment,
      semanticLabel: semanticsLabel,
    );
  }

  // Factory constructors for common sizes
  factory DxIcon.small(
    String icon, {
    Key? key,
    Color? color,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    String? semanticsLabel,
  }) =>
      DxIcon(
        icon,
        key: key,
        size: 20,
        color: color,
        fit: fit,
        alignment: alignment,
        allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
        semanticsLabel: semanticsLabel,
      );

  factory DxIcon.medium(
    String icon, {
    Key? key,
    Color? color,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    String? semanticsLabel,
  }) =>
      DxIcon(
        icon,
        key: key,
        size: 22,
        color: color,
        fit: fit,
        alignment: alignment,
        allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
        semanticsLabel: semanticsLabel,
      );

  factory DxIcon.large(
    String icon, {
    Key? key,
    Color? color,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    String? semanticsLabel,
  }) =>
      DxIcon(
        icon,
        key: key,
        size: 24,
        color: color,
        fit: fit,
        alignment: alignment,
        allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
        semanticsLabel: semanticsLabel,
      );
}

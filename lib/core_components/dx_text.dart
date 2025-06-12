import 'package:flutter/material.dart';
import 'constants/dx_colors.dart';
import 'constants/dx_text_styles.dart';

enum DxTextType {
  h1, // Heading 1
  h2, // Heading 2
  h3, // Heading 3
  h4, // Heading 4
  h5, // Heading 5
  h6, // Heading 6
  h7,
  p1, // Paragraph 1
  p2, // Paragraph 2
  p3, // Paragraph 3
  caption, // Caption
  overline, // Overline
  button, // Button text
  label, // Label text
}

class DxText extends StatelessWidget {
  final String? text;
  final DxTextType type;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final FontWeight? fontWeight;
  final double? fontSize;
  final double? letterSpacing;
  final double? height;
  final bool softWrap;

  const DxText({
    super.key,
    this.text,
    this.type = DxTextType.p1,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.fontWeight,
    this.fontSize,
    this.letterSpacing,
    this.height,
    this.softWrap = true,
  });

  TextStyle _getTextStyle() {
    final defaultColor = color ?? DxColors.neutral900;

    switch (type) {
      case DxTextType.h1:
        return DxTextStyles.primaryFont400(fontSize ?? 24, defaultColor);
      case DxTextType.h2:
        return DxTextStyles.primaryFont500(fontSize ?? 22, defaultColor);
      case DxTextType.h3:
        return DxTextStyles.primaryFont500(fontSize ?? 18, defaultColor);
      case DxTextType.h4:
        return DxTextStyles.primaryFont600(fontSize ?? 20, defaultColor);
      case DxTextType.h5:
        return DxTextStyles.primaryFont600(fontSize ?? 18, defaultColor);
      case DxTextType.h6:
        return DxTextStyles.primaryFont500(fontSize ?? 16, defaultColor);
      case DxTextType.h7:
        return DxTextStyles.primaryFont700(fontSize ?? 14, defaultColor);
      case DxTextType.p1:
        return DxTextStyles.primaryFont400(fontSize ?? 14, DxColors.neutral200);
      case DxTextType.p2:
        return DxTextStyles.primaryFont400(fontSize ?? 14, defaultColor);
      case DxTextType.p3:
        return DxTextStyles.primaryFont400(fontSize ?? 13, defaultColor);
      case DxTextType.caption:
        return DxTextStyles.primaryFont400(fontSize ?? 12, defaultColor);
      case DxTextType.overline:
        return DxTextStyles.primaryFont500(fontSize ?? 12, defaultColor);
      case DxTextType.button:
        return DxTextStyles.primaryFont500(fontSize ?? 14, DxColors.white);
      case DxTextType.label:
        return DxTextStyles.primaryFont500(fontSize ?? 12, defaultColor);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: _getTextStyle().copyWith(
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        height: height,
      ),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      softWrap: softWrap,
    );
  }
}

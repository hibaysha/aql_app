import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'constants/dx_colors.dart';
import 'constants/dx_text_styles.dart';

enum DxButtonVariant {
  textIcon,    // Text followed by icon in circle
  iconText,    // Icon in circle followed by text
  textOnly,    // Text only button
  iconOnly,    // Circular icon button
  text,        // Same design as iconText but without icon
}

class DxButtonStyle {
  final double height;
  final double? width;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final Color backgroundColor;
  final Color textColor;
  final double borderRadius;
  final double elevation;
  final double fontSize;
  final FontWeight fontWeight;
  final Border? border;

  DxButtonStyle({
    required this.height,
    this.width,
    required this.padding,
    this.margin = const EdgeInsets.all(0),
    required this.backgroundColor,
    required this.textColor,
    required this.borderRadius,
    this.elevation = 0,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w500,
    this.border,
  });
}

class DxButton extends StatelessWidget {
  final String? text;
  final Widget? icon;
  final VoidCallback? onPressed;
  final DxButtonVariant variant;
  final bool isLoading;
  final bool disabled;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? iconBackgroundColor;
  final double? width;
  final double? height;
  final EdgeInsets? margin;
  final bool hasBorder;
  final Color? borderColor;
  final double? borderWidth;

  const DxButton({
    super.key,
    this.text,
    this.icon,
    this.onPressed,
    this.variant = DxButtonVariant.textOnly,
    this.isLoading = false,
    this.disabled = false,
    this.backgroundColor,
    this.textColor,
    this.iconBackgroundColor,
    this.width,
    this.height,
    this.margin,
    this.hasBorder = false,
    this.borderColor,
    this.borderWidth,
  });

  DxButtonStyle _getButtonStyle() {
    final defaultMargin = margin ?? const EdgeInsets.all(0);
    final defaultBorder = hasBorder && variant != DxButtonVariant.textOnly
        ? Border.all(
            color: borderColor ?? DxColors.primary,
            width: borderWidth ?? 1.0,
          )
        : null;
    
    switch (variant) {
      case DxButtonVariant.textIcon:
      case DxButtonVariant.iconText:
      case DxButtonVariant.text:
        return DxButtonStyle(
          height: height ?? 50,
          width: width,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          margin: defaultMargin,
          backgroundColor: backgroundColor ?? DxColors.primary,
          textColor: textColor ?? DxColors.white,
          borderRadius: 32,
          fontSize: 16,
          border: defaultBorder,
        );

      case DxButtonVariant.iconOnly:
        return DxButtonStyle(
          height: height ?? 45,
          width: height ?? 45,
          padding: const EdgeInsets.all(10),
          margin: defaultMargin,
          backgroundColor: backgroundColor ?? DxColors.primary,
          textColor: textColor ?? DxColors.white,
          borderRadius: 25,
          border: defaultBorder,
        );

      case DxButtonVariant.textOnly:
        return DxButtonStyle(
          height: height ?? 24,
          width: width,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          margin: defaultMargin,
          backgroundColor: Colors.transparent,
          textColor: textColor ?? DxColors.white,
          borderRadius: 0,
          fontSize: 14,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final style = _getButtonStyle();

    // Create circular container with icon for non-iconOnly variants
    final buttonIcon = icon != null && variant != DxButtonVariant.iconOnly
        ? Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: iconBackgroundColor ?? DxColors.white,
              shape: BoxShape.circle,
            ),
            child: Center(child: icon!),
          )
        : null;

    final buttonText = text != null
        ? Padding(
            padding: variant == DxButtonVariant.textOnly 
                ? const EdgeInsets.symmetric(horizontal: 4)
                : EdgeInsets.zero,
            child: Text(
              text!,
              style: TextStyle(
                color: style.textColor,
                fontSize: style.fontSize,
                fontWeight: style.fontWeight,
              ),
            ),
          )
        : null;

    Widget content;
    if (isLoading) {
      content = SizedBox(
        // width: 20,
        // height: 20,
        child: CupertinoActivityIndicator(
          radius: 10,
                  color: DxColors.white,
                ),
      );
    } else {
      switch (variant) {
        case DxButtonVariant.textIcon:
        case DxButtonVariant.iconText:
        case DxButtonVariant.text:
          content = UnconstrainedBox(
            child: Container(
              constraints: width != null 
                  ? BoxConstraints(maxWidth: width!)
                  : const BoxConstraints(),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (variant == DxButtonVariant.iconText && buttonIcon != null) ...[
                    buttonIcon,
                    const SizedBox(width: 8),
                  ],
                  if (buttonText != null) buttonText,
                  if (variant == DxButtonVariant.textIcon && buttonIcon != null) ...[
                    const SizedBox(width: 8),
                    buttonIcon,
                  ],
                ],
              ),
            ),
          );
          break;

        case DxButtonVariant.textOnly:
          content = buttonText ?? const SizedBox();
          break;

        case DxButtonVariant.iconOnly:
          content = icon != null 
              ? icon!
              : const SizedBox();
          break;
      }
    }

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: disabled || isLoading ? null : onPressed,
      child: Container(
        height: style.height,
        width: style.width,
        padding: style.padding,
        margin: style.margin,
        decoration: BoxDecoration(
          color: disabled ? style.backgroundColor.withOpacity(0.5) : style.backgroundColor,
          borderRadius: BorderRadius.circular(style.borderRadius),
          border: style.border,
        ),
        child: Center(child: content),
      ),
    );
  }
} 
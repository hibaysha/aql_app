import 'package:flutter/material.dart';
import 'constants/dx_colors.dart';
import 'dx_text.dart';

enum DxSnackbarType { success, error, info, warning }

class DxSnackbar {
  static void show({
    required BuildContext context,
    required String message,
    DxSnackbarType type = DxSnackbarType.info,
    Duration duration = const Duration(seconds: 2),
    bool showFromTop = false,
  }) {
    final snackbar = SnackBar(
      content: Row(
        children: [
          _getIcon(type),
          const SizedBox(width: 12),
          Expanded(
            child: DxText(
              text: message,
              type: DxTextType.p2,

              color: DxColors.white,
            ),
          ),
        ],
      ),
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.only(
        bottom: showFromTop ? MediaQuery.of(context).size.height - 100 : 20,
        left: 16,
        right: 16,
      ),
      backgroundColor: _getBackgroundColor(type),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      duration: duration,
      elevation: 0,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  static Widget _getIcon(DxSnackbarType type) {
    IconData iconData;
    switch (type) {
      case DxSnackbarType.success:
        iconData = Icons.check_circle_outline;
        break;
      case DxSnackbarType.error:
        iconData = Icons.error_outline;
        break;
      case DxSnackbarType.warning:
        iconData = Icons.warning_amber_outlined;
        break;
      case DxSnackbarType.info:
        iconData = Icons.info_outline;
        break;
    }
    return Icon(iconData, color: DxColors.white, size: 20);
  }

  static Color _getBackgroundColor(DxSnackbarType type) {
    switch (type) {
      case DxSnackbarType.success:
        return DxColors.stateSuccess.withAlpha(100);
      case DxSnackbarType.error:
        return DxColors.stateError.withAlpha(100);
      case DxSnackbarType.warning:
        return DxColors.stateAway.withAlpha(100);
      case DxSnackbarType.info:
        return DxColors.primary.withAlpha(100);
    }
  }
}

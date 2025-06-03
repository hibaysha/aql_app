import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

enum DxNavigationStyle {
  material,
  cupertino,
}

class DxNavigator {
  // Direct widget navigation
  static void push(
    BuildContext context,
    Widget page, {
    DxNavigationStyle style = DxNavigationStyle.material,
    bool fullscreenDialog = false,
  }) {
    if (style == DxNavigationStyle.cupertino) {
      Navigator.of(context).push(
        CupertinoPageRoute(
          builder: (context) => page,
          fullscreenDialog: fullscreenDialog,
        ),
      );
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => page,
          fullscreenDialog: fullscreenDialog,
        ),
      );
    }
  }

  static void pushReplacement(
    BuildContext context,
    Widget page, {
    DxNavigationStyle style = DxNavigationStyle.material,
    bool fullscreenDialog = false,
  }) {
    if (style == DxNavigationStyle.cupertino) {
      Navigator.of(context).pushReplacement(
        CupertinoPageRoute(
          builder: (context) => page,
          fullscreenDialog: fullscreenDialog,
        ),
      );
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => page,
          fullscreenDialog: fullscreenDialog,
        ),
      );
    }
  }

  static void pushAndRemoveUntil(
    BuildContext context,
    Widget page, {
    DxNavigationStyle style = DxNavigationStyle.material,
    bool fullscreenDialog = false,
    RoutePredicate? predicate,
  }) {
    if (style == DxNavigationStyle.cupertino) {
      Navigator.of(context).pushAndRemoveUntil(
        CupertinoPageRoute(
          builder: (context) => page,
          fullscreenDialog: fullscreenDialog,
        ),
        predicate ?? (route) => false,
      );
    } else {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => page,
          fullscreenDialog: fullscreenDialog,
        ),
        predicate ?? (route) => false,
      );
    }
  }

  static void pop(BuildContext context, [dynamic result]) {
    Navigator.of(context).pop(result);
  }

  static void popUntil(
    BuildContext context,
    RoutePredicate predicate,
  ) {
    Navigator.of(context).popUntil(predicate);
  }

  static Future<bool> maybePop(
    BuildContext context, [
    dynamic result,
  ]) async {
    return Navigator.of(context).maybePop(result);
  }

  static bool canPop(BuildContext context) {
    return Navigator.of(context).canPop();
  }
}

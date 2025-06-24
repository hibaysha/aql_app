import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';

class NotiService {
  final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initNotification() async {
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iOS = DarwinInitializationSettings();
    const settings = InitializationSettings(android: android, iOS: iOS);

    try {
      if (Platform.isAndroid) {
        final status = await Permission.notification.request();
        debugPrint('Notification permission granted? ${status.isGranted}');
      }

      await _plugin.initialize(
        settings,
        onDidReceiveNotificationResponse: (response) {
          debugPrint('Notification tapped: ${response.payload}');
        },
      );

      debugPrint('Notification initialized!');
    } catch (e) {
      debugPrint('initNotification error: $e');
      rethrow;
    }
  }

  Future<void> showNotification({
    required String title,
    required String body,
  }) async {
    const android = AndroidNotificationDetails(
      'channel_id',
      'Channel Name',
      importance: Importance.max,
      priority: Priority.high,
    );
    const iOS = DarwinNotificationDetails();

    await _plugin.show(
      0,
      title,
      body,
      NotificationDetails(android: android, iOS: iOS),
    );
  }
}

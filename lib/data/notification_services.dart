// ignore_for_file: prefer_const_constructors

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:voice_chat/res/app_color.dart';

class LocalNotifition {
  static LocalNotifition instance = LocalNotifition();
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  final InitializationSettings _initializationSettings = InitializationSettings(
    //? add app icon with no bg
    android: AndroidInitializationSettings("@mipmap/launcher_icon"),
    iOS: DarwinInitializationSettings(requestAlertPermission: true, requestBadgePermission: true, requestCriticalPermission: true, requestSoundPermission: true),
  );

  NotificationDetails notificationDetails = NotificationDetails(
    android: AndroidNotificationDetails(
      "channelId",
      "channelName",
      priority: Priority.max,
      importance: Importance.max,
      playSound: true,
      enableVibration: false,
    ),
    iOS: DarwinNotificationDetails(
      presentAlert: true,
      presentSound: true,
      presentBadge: true,
    ),
  );

  // initialize
  setSettings() async {
    await flutterLocalNotificationsPlugin.initialize(_initializationSettings);
  }
}

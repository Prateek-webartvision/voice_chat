// ignore_for_file: prefer_const_constructors

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotifition {
  static LocalNotifition instance = LocalNotifition();
  // AndroidInitializationSettings androidSettings = AndroidInitializationSettings("@mipmap/ic_launcher.png");
  // DarwinInitializationSettings iosSettings = DarwinInitializationSettings(
  //   requestAlertPermission: true,
  //   requestBadgePermission: true,
  //   requestCriticalPermission: true,
  //   requestSoundPermission: true,
  // );
  InitializationSettings initializationSettings = InitializationSettings(
    android: AndroidInitializationSettings("@mipmap/ic_launcher.png"),
    iOS: DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestCriticalPermission: true,
      requestSoundPermission: true,
    ),
  );

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
}

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotifition {
  static LocalNotifition instance = LocalNotifition();
  FlutterLocalNotificationsPlugin flutterNotiPlugin = FlutterLocalNotificationsPlugin();

  final InitializationSettings _initializationSettings = const InitializationSettings(
    //? add app icon with no bg
    android: AndroidInitializationSettings("@mipmap/launcher_icon"),
    iOS: DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestCriticalPermission: true,
      requestSoundPermission: true,
    ),
  );

  //*defoult notification
  NotificationDetails notificationDetails = const NotificationDetails(
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
    await flutterNotiPlugin.initialize(_initializationSettings);
  }
}

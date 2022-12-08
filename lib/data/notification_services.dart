import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:voice_chat/res/app_color.dart';

class LocalNotifition {
  static LocalNotifition instance = LocalNotifition();
  FlutterLocalNotificationsPlugin flutterNotiPlugin = FlutterLocalNotificationsPlugin();

  final InitializationSettings _initializationSettings = const InitializationSettings(
    //? add app icon with no bg
    android: AndroidInitializationSettings("@mipmap/ic_launcher"),
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
      color: AppColor.closeToPurple,
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

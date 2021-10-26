// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
// FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin ;
// Future<void> showNotification(
//     int notificationId,
//     String notificationTitle,
//     String notificationContent,
//     /*String payload, */{
//       String channelId = '1234',
//       String channelTitle = 'Android Channel',
//       String channelDescription = 'Default Android Channel for notifications',
//       Priority notificationPriority = Priority.High,
//       Importance notificationImportance = Importance.Max,
//     }) async {
//   var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
//     channelId,
//     channelTitle,
//     channelDescription,
//     playSound: false,
//     importance: notificationImportance,
//     priority: notificationPriority,
//   );
//   var iOSPlatformChannelSpecifics = new IOSNotificationDetails(presentSound: false);
//
//   var platformChannelSpecifics = new NotificationDetails(androidPlatformChannelSpecifics,iOSPlatformChannelSpecifics);
//
//
//   await flutterLocalNotificationsPlugin.show(
//     notificationId,
//     notificationTitle,
//     notificationContent,
//     platformChannelSpecifics,
//    /* payload: payload,*/
//   );
// }
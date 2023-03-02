
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class NotificationHelper {
  static showDefaultNotification(RemoteMessage message) async {
    await AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: message.hashCode,
          channelKey: "high_importance_channel",
          title: message.data['title'],
          body: message.data['body'],
          notificationLayout: NotificationLayout.Default,
          payload: Map<String, String>.from(message.data),
          hideLargeIconOnExpand: true,
        )
    );
  }

  static showPigPictureNotification(RemoteMessage message) async {
    await AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: message.hashCode,
          channelKey: "high_importance_channel",
          title: message.data['title'],
          body: message.data['body'],
          bigPicture: "https://res.cloudinary.com/nitishk72/image/upload/v1586796259/nstack_in/courses/flutter/flutter-banner.png",
          notificationLayout: NotificationLayout.BigPicture,
          largeIcon: "https://miro.medium.com/max/500/1*rd_veZDE2LL02Ov9uxfsRg.png",
          payload: Map<String, String>.from(message.data),
          hideLargeIconOnExpand: true,
        )
    );
  }

  static showActionButtonNotification(RemoteMessage message) async {
    await AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: message.hashCode,
          channelKey: "high_importance_channel",
          title: message.data['title'],
          body: message.data['body'],
          notificationLayout: NotificationLayout.Default,
          payload: Map<String, String>.from(message.data),

          hideLargeIconOnExpand: true,
        ),
      actionButtons: [
        NotificationActionButton(key: "button_key", label: "Button label"),
        NotificationActionButton(key: "button_key1", label: "Button label2")
      ]
    );
  }



  static void initializeAwesomeNotification() async {
    AwesomeNotifications().initialize(
      "resource://mipmap/ic_launcher",
      [
        NotificationChannel(
          channelKey: 'high_importance_channel',
          channelName: 'high_importance_channel',
          channelDescription: 'High_importance_channel',
          ledColor: Colors.white,
          defaultColor: Colors.white,
          enableVibration: true,
          playSound: true,
          enableLights: true,
          importance: NotificationImportance.High,

        )
      ],
    );
  }
}

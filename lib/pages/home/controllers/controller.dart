import 'dart:io';

import 'package:fcm/helpers/NotificationsHelper.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../BaseController.dart';

class HomeController extends BaseController {
  final token = "".obs;

  @override
  void onInit() async {
    super.onInit();

    await Permission.notification.request();
    await Permission.accessNotificationPolicy.request();
    await Permission.ignoreBatteryOptimizations.request();
    await Permission.systemAlertWindow.request();

    initMessaging();
  }

  void initMessaging() async {
    if (Platform.isIOS) {
      await FirebaseMessaging.instance.requestPermission();
    }

    FirebaseMessaging.instance.getInitialMessage().then((RemoteMessage? message) {
      if (message != null) {
        Logger().w(message.data);
      }
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      NotificationHelper.showDefaultNotification(message);
      Logger().w(message.data);
    });
    FirebaseMessaging.instance.subscribeToTopic('test');
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      Logger().i(message.data);
    });


    getToken();

    token.value = await FirebaseMessaging.instance.getToken()??"";
  }


  void getToken() {
    FirebaseMessaging.instance.getToken.call().then((token) {
      Logger().i(token);
    });
  }
}

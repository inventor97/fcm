import 'package:fcm/helpers/NotificationsHelper.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../controllers/controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    NotificationHelper.showDefaultNotification(
                        const RemoteMessage(data: {"title": "Local Notification", "body": "Local Notification body"}));
                  },
                  child: const Text("Local Notification"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SelectableText(controller.token.value),
              ),
            ],
          )),
    );
  }
}

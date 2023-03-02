import 'package:fcm/firebase_options.dart';
import 'package:fcm/helpers/NotificationsHelper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:logger/logger.dart';

@pragma('vm:entry-point')
class FCMHelper {

  static Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {

    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

    Logger().i(message.data);

    NotificationHelper.showDefaultNotification(message);
  }

  static Future<void> initFCM() async {
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    NotificationHelper.initializeAwesomeNotification();

    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }
}

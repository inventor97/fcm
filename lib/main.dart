import 'package:fcm/firebase_options.dart';
import 'package:fcm/helpers/FCMHelper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'AppBinding.dart';
import 'AppPages.dart';
import 'AppRoutes.dart';
import 'i18n/Messages.dart';
import 'themes/default.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await FCMHelper.initFCM();

  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'AppName',
      translations: Messages(),
      locale: Messages.defaultLang,
      debugShowCheckedModeBanner: false,
      theme: kDefaultTheme,
      themeMode: ThemeMode.light,
      getPages: AppPages.routes,
      initialRoute: AppRoutes.BASE,
      initialBinding: AppBinding(),
    );
  }
}

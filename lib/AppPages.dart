import 'package:fcm/AppRoutes.dart';
import 'package:fcm/pages/home/bindings/binding.dart';
import 'package:fcm/pages/home/views/view.dart';
import 'package:get/get.dart';

class AppPages {
  static final List<GetPage> routes = [
    GetPage(
      name: AppRoutes.BASE,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
  ];
}

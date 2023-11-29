import 'package:get/get.dart';
import 'package:modul_5_latihan/app/modules/home/views/image_view.dart';
import 'package:modul_5_latihan/app/modules/home/views/realtime_view.dart';
import 'package:modul_5_latihan/app/modules/home/views/signup_view.dart';
import 'package:modul_5_latihan/app/modules/home/views/users_view.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => SignUpView(),
    ),
    GetPage(
      name: _Paths.REALTIME,
      page: () => RealtimeView(),
    ),
    GetPage(
      name: _Paths.STORAGE,
      page: () => ImageView(),
    ),
    GetPage(
      name: _Paths.USER,
      page: () => UsersView(),
    ),
  ];
}

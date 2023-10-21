import 'package:get/get.dart';
import 'package:modul_3_latihan/app/modules/webview/bindings/web_binding.dart';
import 'package:modul_3_latihan/app/modules/webview/views/web_view.dart';

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
        name: _Paths.WEBVIEW,
        page: () => const WebView(),
        binding: WebBinding())
  ];
}

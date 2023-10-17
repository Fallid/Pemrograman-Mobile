// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:modul_2_prak/app/modules/Dashboard/bindings/dashboard_binding.dart';
import 'package:modul_2_prak/app/modules/Dashboard/view/dashboard_page.dart';
import 'package:modul_2_prak/app/modules/Notification/bindings/notif_binding.dart';
import 'package:modul_2_prak/app/modules/Notification/view/notif_page.dart';
import 'package:modul_2_prak/app/modules/Profile/bindings/profile_binding.dart';
import 'package:modul_2_prak/app/modules/Profile/view/profile_page.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.DASHBOARD;

  static final routes = [
    GetPage(
        name: _Paths.DASHBOARD,
        page: () => const DashboardView(),
        binding: DashboardBinding()),
    GetPage(
        name: _Paths.NOTIFICATION,
        page: () => const NotifView(),
        binding: NotifBinding()),
    GetPage(
        name: _Paths.PROFILE,
        page: () => ProfileView(),
        binding: ProfileBinding())
  ];
}

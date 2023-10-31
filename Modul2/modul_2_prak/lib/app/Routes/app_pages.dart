// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:modul_2_prak/app/modules/Dashboard/bindings/dashboard_binding.dart';
import 'package:modul_2_prak/app/modules/Dashboard/bindings/news_binding.dart';
import 'package:modul_2_prak/app/modules/Dashboard/view/dashboard_page.dart';
import 'package:modul_2_prak/app/modules/Dashboard/view/news_page.dart';
import 'package:modul_2_prak/app/modules/Notification/bindings/notif_binding.dart';
import 'package:modul_2_prak/app/modules/Notification/view/notif_page.dart';
import 'package:modul_2_prak/app/modules/Profile/bindings/profile_binding.dart';
import 'package:modul_2_prak/app/modules/Profile/view/profile_page.dart';
import 'package:modul_2_prak/app/modules/Trending/bindings/trending_bindings.dart';
import 'package:modul_2_prak/app/modules/Trending/view/trending_detail.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.NEWS;

  static final routes = [
    GetPage(
        name: _Paths.DASHBOARD,
        page: () => const DashboardView(),
        binding: DashboardBinding()),
    GetPage(
        name: _Paths.NOTIFICATION,
        page: () => NotifView(),
        binding: NotifBinding()),
    GetPage(
        name: _Paths.PROFILE,
        page: () => ProfileView(),
        binding: ProfileBinding()),
    GetPage(
        name: _Paths.TRENDING,
        page: () => TrendingView(),
        binding: TrendingBinding()), 
    GetPage(
        name: _Paths.NEWS,
        page: () => NewsView(),
        binding: NewsBinding()),
  ];
}

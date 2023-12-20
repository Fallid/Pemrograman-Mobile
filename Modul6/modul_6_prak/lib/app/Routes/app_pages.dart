// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:modul_4_prak/app/modules/Dashboard/bindings/dashboard_binding.dart';
import 'package:modul_4_prak/app/modules/Dashboard/bindings/news_binding.dart';
import 'package:modul_4_prak/app/modules/Dashboard/view/dashboard_page.dart';
import 'package:modul_4_prak/app/modules/Dashboard/view/news_page.dart';
import 'package:modul_4_prak/app/modules/Discussion/bindings/discussion_bindings.dart';
import 'package:modul_4_prak/app/modules/Discussion/view/discussion_page.dart';
import 'package:modul_4_prak/app/modules/Forum/bindings/forum_binding.dart';
import 'package:modul_4_prak/app/modules/Forum/view/forum_page.dart';
import 'package:modul_4_prak/app/modules/Forum/view/forum_update.dart';
import 'package:modul_4_prak/app/modules/Login/bindings/login_binding.dart';
import 'package:modul_4_prak/app/modules/Login/view/login.dart';
import 'package:modul_4_prak/app/modules/Notification/bindings/notif_binding.dart';
import 'package:modul_4_prak/app/modules/Notification/view/notif_page.dart';
import 'package:modul_4_prak/app/modules/Profile/bindings/profile_binding.dart';
import 'package:modul_4_prak/app/modules/Profile/view/profile_page.dart';
import 'package:modul_4_prak/app/modules/Register/bindings/register_binding.dart';
import 'package:modul_4_prak/app/modules/Register/view/register.dart';
import 'package:modul_4_prak/app/modules/Trending/bindings/trending_bindings.dart';
import 'package:modul_4_prak/app/modules/Trending/view/trending_detail.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.DASHBOARD;
  static const NOINITIAL = Routes.LOGIN;

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
        page: () => const TrendingView(),
        binding: TrendingBinding()),
    GetPage(
        name: _Paths.NEWS,
        page: () => const NewsView(),
        binding: NewsBinding()),
    GetPage(
        name: _Paths.REGISTER,
        page: () => RegisterView(),
        binding: RegisterBinding()),
    GetPage(
        name: _Paths.LOGIN, page: () => LoginView(), binding: LoginBinding()),
    GetPage(
        name: _Paths.DISCUSSION,
        page: () => DiscussionView(),
        binding: DiscussionBinding()),
    GetPage(
        name: _Paths.FORUM, page: () => ForumView(), binding: ForumBinding()),
    GetPage(
        name: _Paths.UPDATEFORUM,
        page: () => UpdateView(),
        binding: ForumBinding())
  ];
}

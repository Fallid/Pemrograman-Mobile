import 'package:get/get.dart';
import 'package:prak_modul_1/Routes/name_page.dart';
import 'package:prak_modul_1/presentation/Dashboard/home_page.dart';
import 'package:prak_modul_1/presentation/Notification/notif_page.dart';
import 'package:prak_modul_1/presentation/Profile/profile_page.dart';

class PageRoutes {
  static final pages = [
    GetPage(
        name: PageName.home,
        page: () => const HomePage(),
        transition: Transition.cupertino,
        transitionDuration: const Duration(milliseconds: 250)),
    GetPage(
        name: PageName.notification,
        page: () => const NotifPage(),
        transition: Transition.cupertino,
        transitionDuration: const Duration(milliseconds: 250)),
    GetPage(
        name: PageName.profile,
        page: () => const ProfilePage(),
        transition: Transition.cupertino,
        transitionDuration: const Duration(milliseconds: 250))
  ];
}

import 'package:get/get.dart';
import 'package:prak_modul_1/app/Routes/name_page.dart';
import 'package:prak_modul_1/app/modules/Dashboard/view/home_page.dart';
import 'package:prak_modul_1/app/modules/Notification/view/notif_page.dart';
import 'package:prak_modul_1/app/modules/Profile/view/profile_page.dart';

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

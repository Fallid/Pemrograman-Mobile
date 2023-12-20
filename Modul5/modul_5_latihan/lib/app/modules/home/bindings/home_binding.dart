import 'package:get/get.dart';
import 'package:modul_5_latihan/app/modules/home/controllers/account_controller.dart';
import 'package:modul_5_latihan/app/modules/home/controllers/database_controller.dart';
import 'package:modul_5_latihan/app/modules/home/controllers/realtime_controller.dart';
import 'package:modul_5_latihan/app/modules/home/controllers/storage_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());

    Get.lazyPut(() => AccountController());
    Get.lazyPut(() => DatabaseController());
    Get.lazyPut(() => RealtimeController());
    Get.lazyPut(() => StorageController());
  }
}

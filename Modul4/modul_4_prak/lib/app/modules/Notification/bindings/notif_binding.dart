import 'package:get/get.dart';
import 'package:modul_4_prak/app/modules/Notification/controller/notif_controller.dart';

class NotifBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotifController>(() => NotifController());
  }
}

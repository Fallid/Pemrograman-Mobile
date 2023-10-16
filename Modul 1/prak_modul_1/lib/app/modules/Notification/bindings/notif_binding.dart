import 'package:get/get.dart';
import 'package:prak_modul_1/app/modules/Notification/controller/notif_controller.dart';

class NotifBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotifController>(() => NotifController());
  }
}

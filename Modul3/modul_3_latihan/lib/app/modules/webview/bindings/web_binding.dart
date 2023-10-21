import 'package:get/get.dart';
import 'package:modul_3_latihan/app/modules/webview/controllers/web_controller.dart';

class WebBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WebController>(
      () => WebController(),
    );
  }
}

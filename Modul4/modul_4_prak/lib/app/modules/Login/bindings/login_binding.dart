import 'package:get/get.dart';
import 'package:modul_4_prak/app/modules/Login/controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
  }
}

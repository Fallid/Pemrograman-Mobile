// ignore: file_names
import 'package:get/get.dart';
import 'package:modul_4_prak/app/modules/Register/controllers/register_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RegisterController());
  }
}

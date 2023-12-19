import 'package:get/get.dart';
import 'package:modul_4_prak/app/modules/Profile/controllers/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}

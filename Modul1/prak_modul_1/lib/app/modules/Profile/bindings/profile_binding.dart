import 'package:get/get.dart';
import 'package:prak_modul_1/app/modules/Profile/controllers/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}

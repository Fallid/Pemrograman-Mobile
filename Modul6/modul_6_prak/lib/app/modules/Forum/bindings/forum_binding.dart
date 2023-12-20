import 'package:get/get.dart';
import 'package:modul_4_prak/app/modules/Forum/controllers/forum_controller.dart';

class ForumBinding extends Bindings {
  @override
  void dependencies() {
    void dependencies() {
      Get.lazyPut<ForumController>(() => ForumController());
    }
  }
}

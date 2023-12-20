import 'package:get/get.dart';
import 'package:modul_4_prak/app/modules/Discussion/controller/discussion_controller.dart';

class DiscussionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DiscussionController>(() => DiscussionController());
  }
}

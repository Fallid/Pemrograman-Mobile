import 'package:get/get.dart';
import 'package:modul_4_prak/app/modules/Dashboard/controllers/news_controllers.dart';

class NewsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewsController>(() => NewsController());
  }
}

import 'package:get/get.dart';
import 'package:modul_4_latihan/app/modules/Trending/controllers/trending_controller.dart';

class TrendingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TrendingController>(
      () => TrendingController(),
    );
  }
}

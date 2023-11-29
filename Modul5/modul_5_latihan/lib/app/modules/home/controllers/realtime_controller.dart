import 'package:appwrite/appwrite.dart';
import 'package:modul_5_latihan/app/modules/home/controllers/home_controller.dart';

class RealtimeController extends HomeController {
  Realtime? realtime;
  @override
  void onInit() {
    super.onInit();
    // appwrite
    realtime = Realtime(client);
  }

  subsUserName() async {
    final subscription = realtime!.subscribe(['files']);
    subscription.stream.listen((response) {
      if (response.events.contains('buckets.*.files.*.create')) {
        print("RealtimeController:: subsUserName ${response.payload}");
        print("RealtimeController:: subsUserName ${response.events}");
      }
    });
  }
}

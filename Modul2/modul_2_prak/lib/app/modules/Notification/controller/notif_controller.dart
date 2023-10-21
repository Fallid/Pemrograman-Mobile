import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class NotifController extends GetxController {
  static NotifController notifController = Get.find();
  final storageNotif = GetStorage();
  String? passName;
  String? passBio;
  late int itemCount;
  readNamaStorage() async {
    passName = storageNotif.read("nama");
    itemCount = storageNotif.read("totalItem");
  }
}

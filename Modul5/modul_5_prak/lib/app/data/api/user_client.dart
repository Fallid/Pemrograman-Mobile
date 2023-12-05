import 'package:get/get.dart';
import 'package:appwrite/appwrite.dart';
import 'package:modul_4_prak/app/data/api/appwrite.dart';

class UserClient extends GetxController {
  Client client = Client();

  @override
  void onInit() {
    super.onInit();
    // appwrite
    client
        .setEndpoint(AppWrite.Endpoint)
        .setProject(AppWrite.ProjectId)
        .setSelfSigned(status: true);
  }
}

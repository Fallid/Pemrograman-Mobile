import 'package:get/get.dart';
import 'package:appwrite/appwrite.dart';

class HomeController extends GetxController {
  Client client = Client();

  @override
  void onInit() {
    super.onInit();
    // appwrite
    const endPoint = "https://cloud.appwrite.io/v1";
    const projectID = "65661953844d0b4181d0";
    client
        .setEndpoint(endPoint)
        .setProject(projectID)
        .setSelfSigned(status: true);
  }
}

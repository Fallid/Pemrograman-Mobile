import 'package:get/get.dart';
import 'package:appwrite/appwrite.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  // void increment() => count.value++;

  Client client = Client();

  @override
  void onInit() {
    super.onInit();
    // appwrite
    const endPoint = "https://cloud.appwrite.io/v1'";
    const projectID = "65661953844d0b4181d0";
    client
        .setEndpoint(endPoint)
        .setProject(projectID)
        .setSelfSigned(status: true);
  }
}

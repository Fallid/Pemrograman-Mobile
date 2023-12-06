import 'package:appwrite/models.dart';
import 'package:get/get.dart';
import 'package:appwrite/appwrite.dart';
import 'package:modul_4_prak/app/data/api/appwrite.dart';

class UserClient extends GetxController {
  Client client = Client();
  Databases? databases;
  Storage? storages;
  RxList<Document> disscussion = <Document>[].obs;

  @override
  void onInit() {
    super.onInit();
    // appwrite
    client
        .setEndpoint(AppWrite.Endpoint)
        .setProject(AppWrite.ProjectId)
        .setSelfSigned(status: true);

    databases = Databases(client);
    storages = Storage(client);
    fetchDiscussion();
  }

  Future<void> fetchDiscussion() async {
    try {
      var response = await databases!.listDocuments(
          collectionId: AppWrite.CollectionId, databaseId: AppWrite.DatabaseId);
      disscussion.assignAll(response.documents);
    } catch (e) {
      print('Error fetching data: $e');
    }
  }
}

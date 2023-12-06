import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:get/get.dart';
import 'package:modul_4_prak/app/data/api/appwrite.dart';
import 'package:modul_4_prak/app/data/api/user_client.dart';

class ForumController extends GetxController {
  final UserClient db = Get.put(UserClient());
  // Future<dynamic> deleteForum(String fileId){
  //   final response  =  Storage(client)
  // }

  static ForumController forum = Get.find();
  getCollection() async {
    final client =
        Client().setEndpoint(AppWrite.Endpoint).setProject(AppWrite.ProjectId);
    final database = Databases(client);
    try {
      DocumentList response = await database.listDocuments(
          databaseId: AppWrite.DatabaseId,
          collectionId: AppWrite.CollectionId,
          queries: [Query.equal('Forum', 'forum')]);
      print(response.documents.map((e) => e.data).toList());
      return response.documents.map((e) => e.data).toList();
    } on AppwriteException catch (e) {
      print(e);
    }
  }
}

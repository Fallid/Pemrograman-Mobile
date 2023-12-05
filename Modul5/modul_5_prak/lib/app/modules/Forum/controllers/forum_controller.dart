import 'package:appwrite/appwrite.dart';
import 'package:get/get.dart';
import 'package:modul_4_prak/app/data/api/appwrite.dart';

class ForumController extends GetxController {
  // Future<dynamic> deleteForum(String fileId){
  //   final response  =  Storage(client)
  // }
  static ForumController forum = Get.find();
  Future<dynamic> getCollection() async {
    final client =
        Client().setEndpoint(AppWrite.Endpoint).setProject(AppWrite.ProjectId);
    final database = Databases(client);
    try {
      final documents = await database.listDocuments(
          databaseId: AppWrite.DatabaseId,
          collectionId: AppWrite.CollectionId,
          queries: [Query.equal('Forum', 'forum')]);
      print(documents.toMap());
      return documents.toMap();
    } on AppwriteException catch (e) {
      print(e);
    }
  }
}

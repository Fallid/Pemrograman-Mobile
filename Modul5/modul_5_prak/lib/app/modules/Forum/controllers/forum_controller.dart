import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:get/get.dart';
import 'package:modul_4_prak/app/Routes/app_pages.dart';
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
      List<Map<String, dynamic>> dataList =
          response.documents.map((e) => e.data).toList();
      dataList.forEach((data) {
        print(data['Title']); // Tampilkan data untuk setiap indeks
        print(data['id']); // Tampilkan data untuk setiap indeks
      });
      return dataList;
    } on AppwriteException catch (e) {
      print(e);
    }
  }

  getIdDocuments() async {
    final client =
        Client().setEndpoint(AppWrite.Endpoint).setProject(AppWrite.ProjectId);
    final database = Databases(client);
    try {
      DocumentList response = await database.listDocuments(
          databaseId: AppWrite.DatabaseId,
          collectionId: AppWrite.CollectionId,
          queries: [Query.equal('Forum', 'forum')]);
      List<String> dataList = response.documents.map((e) => e.$id).toList();
      dataList.forEach((data) {
        print(data); // Tampilkan data untuk setiap indeks
      });
      return dataList;
    } on AppwriteException catch (e) {
      print(e);
    }
  }

  deleteDocuments(String id) {
    final client =
        Client().setEndpoint(AppWrite.Endpoint).setProject(AppWrite.ProjectId);
    final database = Databases(client);
    final result = database.deleteDocument(
      databaseId: AppWrite.DatabaseId,
      collectionId: AppWrite.CollectionId,
      documentId: id,
    );

    result.then((response) {
      print(response);
      Get.offAllNamed(Routes.FORUM);
    }).catchError((error) {
      print(error.response);
    });
  }
}

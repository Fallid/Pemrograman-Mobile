import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modul_4_prak/app/Routes/app_pages.dart';
import 'package:modul_4_prak/app/data/api/appwrite.dart';
import 'package:modul_4_prak/app/data/api/user_client.dart';

class ForumController extends GetxController {
  final TextEditingController titlecontroller = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final UserClient db = Get.put(UserClient());
  final UserClient dbController = Get.put(UserClient());
  static ForumController forum = Get.find();
  String idPass = "";
  String descPass = "";
  String titlePass = "";

  Databases? databases;
  @override
  void onInit() {
    super.onInit();
    databases = Databases(dbController.client);
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

  Future updateDiscussion(Map map) async {
    try {
      final result = await databases!.updateDocument(
        databaseId: AppWrite.DatabaseId,
        documentId: idPass,
        collectionId: AppWrite.CollectionId,
        data: map,
        permissions: [
          Permission.read(Role.any()),
          Permission.update(Role.any()),
          Permission.delete(Role.any()),
        ],
      );
      print("DatabaseController:: inputName $result");
      Get.offAllNamed(Routes.FORUM);
    } catch (error) {
      Get.defaultDialog(
        title: "Error Database",
        titlePadding: const EdgeInsets.only(top: 15, bottom: 5),
        titleStyle: Get.context?.theme.textTheme.titleLarge,
        content: Text(
          "$error",
          style: Get.context?.theme.textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        contentPadding: const EdgeInsets.only(top: 5, left: 15, right: 15),
      );
    }
  }

  getIdDocument(String id, String desc, String title) {
    idPass = id;
    descPass = desc;
    titlePass = title;
  }
}

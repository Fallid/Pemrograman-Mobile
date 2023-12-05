import 'package:appwrite/appwrite.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:modul_4_prak/app/data/api/user_client.dart';

class DiscussionController extends GetxController {
  RxInt selectedIndex = 0.obs;
  final UserClient dbController = Get.put(UserClient());
  final TextEditingController titlecontroller = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  // RxList<Document> documents = <Document>[].obs;

  void handleCategorySelection(int index) {
    selectedIndex.value = index;
  }

  Databases? databases;
  @override
  void onInit() {
    super.onInit();
    databases = Databases(dbController.client);
  }

  Future inputDiscussion(Map map) async {
    try {
      final result = await databases!.createDocument(
        databaseId: "656f6caf6f64ebd2d053",
        documentId: ID.unique(),
        collectionId: "656f6cbde0026b924ffc",
        data: map,
        permissions: [
          Permission.read(Role.any()),
          Permission.update(Role.any()),
          Permission.delete(Role.any()),
        ],
      );
      print("DatabaseController:: inputName $result");
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

  // Future<void> fetchData() async {
  //   try {
  //     // Replace 'collectionId' with the ID of your collection
  //     var response = await databases!.listDocuments(
  //         collectionId: "656f4d0a69a1f16c389f",
  //         databaseId: "656f4d2e4cba7fee5d28");
  //     documents.assignAll(response.documents as Iterable<Document>);
  //   } catch (e) {
  //     print('Error fetching data: $e');
  //   }
  // }
}

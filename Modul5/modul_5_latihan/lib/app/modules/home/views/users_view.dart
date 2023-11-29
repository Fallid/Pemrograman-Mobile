import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modul_5_latihan/app/modules/home/controllers/database_controller.dart';

class UsersView extends StatelessWidget {
  final DatabaseController databaseController = Get.put(DatabaseController());
  final TextEditingController nameController = TextEditingController();
  final TextEditingController umurController = TextEditingController();

  UsersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Store Name in Appwrite'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Enter your name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: umurController,
              decoration: InputDecoration(
                labelText: 'Enter your umur',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (nameController.text.isNotEmpty) {
                  Map<String, dynamic> data = {
                    'name': nameController.text,
                    'umur': umurController.text,
                  };
                  databaseController.storeUserName(data);
                } else {
                  Get.snackbar(
                    'Input Error',
                    'Name cannot be empty',
                    snackPosition: SnackPosition.BOTTOM,
                  );
                }
              },
              child: Text('Store Name'),
            ),
          ],
        ),
      ),
    );
  }
}

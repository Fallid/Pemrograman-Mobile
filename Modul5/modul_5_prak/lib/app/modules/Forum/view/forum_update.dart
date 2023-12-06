import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modul_4_prak/app/modules/Forum/controllers/forum_controller.dart';

class UpdateView extends GetView<ForumController> {
  const UpdateView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForumController());
    return Scaffold(
      appBar: AppBar(),
      // body: Text("Ini create discussion"),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
              controller: controller.titlecontroller,
              decoration: InputDecoration(
                labelText: controller.titlePass,
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: controller.descriptionController,
              decoration: InputDecoration(
                labelText: controller.descPass,
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (controller.titlecontroller.text.isNotEmpty) {
                  Map<String, dynamic> data = {
                    'Title': controller.titlecontroller.text,
                    'Description': controller.descriptionController.text,
                  };
                  controller.updateDiscussion(data);
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
            // ElevatedButton(
            //   onPressed: () {
            //     controller.fetchData();
            //   },
            //   child: Text('Fetch Data'),
            // ),
          ],
        ),
      ),
    );
  }
}

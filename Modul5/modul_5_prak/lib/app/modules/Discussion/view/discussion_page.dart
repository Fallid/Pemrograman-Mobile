import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modul_4_prak/app/modules/Discussion/controller/discussion_controller.dart';

class DisucssionView extends GetView<DiscussionController> {
  const DisucssionView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DiscussionController());
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
                labelText: 'Enter Title',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: controller.descriptionController,
              decoration: InputDecoration(
                labelText: 'Enter Description',
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
                  controller.inputDiscussion(data);
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

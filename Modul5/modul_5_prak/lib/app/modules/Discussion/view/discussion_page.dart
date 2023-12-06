import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modul_4_prak/app/modules/Discussion/controller/discussion_controller.dart';
import 'package:modul_4_prak/app/modules/Discussion/controller/storage_controller.dart';
import 'package:modul_4_prak/style/AppStyle.dart';
import 'package:sizer/sizer.dart';

class DiscussionView extends StatefulWidget {
  const DiscussionView({super.key});

  @override
  State<DiscussionView> createState() => _DiscussionViewState();
}

class _DiscussionViewState extends State<DiscussionView> {
  final controller = Get.put(DiscussionController());
  final StorageController storageController = Get.put(StorageController());
  final ImagePicker _picker = ImagePicker();
  XFile? _image;

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = pickedFile;
    });
  }

  List<String> _imageUrls = [];

  Future<void> _fetchImages() async {
    List<String> images = await storageController.listImages();
    setState(() {
      _imageUrls = images;
    });
  }

  void onInit() {
    _fetchImages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.backgroundColor,
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
              onPressed: _pickImage,
              child: Text('Pick Image from Gallery'),
            ),
            if (_image != null) ...[
              Container(
                  width: 50.w,
                  height: 20.h,
                  child: Image.file(File(_image!.path))),
            ],
            Expanded(
              child: ListView.builder(
                itemCount: _imageUrls.length,
                itemBuilder: (context, index) {
                  return Image.network(_imageUrls[index]);
                },
              ),
            ),
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

                storageController.storeImage(File(_image!.path));
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

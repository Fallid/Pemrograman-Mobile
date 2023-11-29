import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modul_5_latihan/app/modules/home/controllers/storage_controller.dart';

class ImageView extends StatefulWidget {
  ImageView({Key? key}) : super(key: key);

  @override
  _ImageViewState createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
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
      appBar: AppBar(
        title: Text('Upload Image'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Pick Image from Gallery'),
            ),
            if (_image != null) ...[
              Image.file(File(_image!.path)),
              ElevatedButton(
                onPressed: () =>
                    storageController.storeImage(File(_image!.path)),
                child: Text('Upload Image'),
              ),
            ],
            Expanded(
              child: ListView.builder(
                itemCount: _imageUrls.length,
                itemBuilder: (context, index) {
                  return Image.network(_imageUrls[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

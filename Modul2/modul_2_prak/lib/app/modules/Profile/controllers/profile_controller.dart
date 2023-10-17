import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  static ProfileController profileController = Get.find();

  late Rx<File?> pickFile;
  File? get profileImage => pickFile.value;
  XFile? imageFile;
  pickImageFileFromGallery() async {
    imageFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (imageFile != null) {
      Get.snackbar("Profile Image", "Berhasil upload image dari gallery");
    } else {
      Exception("Masukkan Gambar");
    }

    pickFile = Rx<File?>(File(imageFile!.path));
  }

  pickImageFileFromCamera() async {
    imageFile = await ImagePicker().pickImage(source: ImageSource.camera);

    if (imageFile != null) {
      Get.snackbar("Profile Image", "Berhasil upload image dari kamera");
    }

    pickFile = Rx<File?>(File(imageFile!.path));
  }
}

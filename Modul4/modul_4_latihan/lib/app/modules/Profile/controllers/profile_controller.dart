import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modul_4_latihan/app/data/storage/profile_model.dart';

class ProfileController extends GetxController {
  static ProfileController profileController = Get.find();
  String imageDefault =
      "/data/user/0/com.naufal.modul_2_prak/cache/ee24cbe3-9352-4835-945e-d9a06cd83ad3/blank-profile-picture-g5d583e0d9_1280.png";
  late Rx<File?> pickFile;
  File? get profileImage => pickFile.value;
  XFile? imageFile;
  Rx<List<ProfileModel>> profileModel = Rx<List<ProfileModel>>([]);
  TextEditingController profileNameTextEditController = TextEditingController();
  TextEditingController profileBioTextEditController = TextEditingController();
  late ProfileModel profileModelObj;
  var itemCount = 0.obs;
  final storage = GetStorage();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    profileNameTextEditController.dispose();
    profileBioTextEditController.dispose();
  }

  addNewProfile(String name, String bio) async {
    profileModelObj = ProfileModel(
        profileName: name,
        bio: bio,
        imagePath: imageFile == null ? imageDefault : imageFile!.path);
    profileModel.value.add(profileModelObj);
    await storage.write("nama", name);
    itemCount.value = profileModel.value.length;
    storage.write("totalItem", itemCount.value);
  }

  removeProfile(int index) {
    profileModel.value.removeAt(index);
    itemCount.value = profileModel.value.length;
  }

  pickImageFileFromGallery() async {
    try {
      imageFile = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (imageFile != null) {
        Get.snackbar("Profile Image", "Berhasil upload image dari gallery");
      }

      pickFile = Rx<File?>(File(imageFile!.path));
    } catch (err) {
      Get.snackbar("Profile Image", "anda tidak memilih gambar!");
    }
  }

  pickImageFileFromCamera() async {
    try {
      imageFile = await ImagePicker().pickImage(source: ImageSource.camera);

      if (imageFile != null) {
        Get.snackbar("Profile Image", "Berhasil upload image dari kamera");
      }

      pickFile = Rx<File?>(File(imageFile!.path));
    } catch (err) {
      Get.snackbar("Profile Image", "anda tidak memilih gambar!");
    }
  }
}

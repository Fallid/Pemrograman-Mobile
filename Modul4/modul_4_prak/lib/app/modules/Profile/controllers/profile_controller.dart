import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modul_4_prak/app/Routes/app_pages.dart';
import 'package:modul_4_prak/app/data/storage/profile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  static ProfileController profileController = Get.find();
  final SharedPreferences _prefs = Get.find<SharedPreferences>();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  RxBool isLoggedIn = false.obs;
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

  void logout() {
    _prefs.remove('user_token'); // Hapus token autentikasi dari penyimpanan
    isLoggedIn.value = false; // Set status login menjadi false
    _auth.signOut(); // Sign out dari Firebase Authentication

    Get.offAllNamed(Routes
        .LOGIN); // Navigate ke HomePage dan hapus semua halaman sebelumnya
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

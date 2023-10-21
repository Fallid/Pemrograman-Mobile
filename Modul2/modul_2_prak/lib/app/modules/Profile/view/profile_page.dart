// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modul_2_prak/app/modules/Profile/controllers/profile_controller.dart';
import 'package:modul_2_prak/style/AppStyle.dart';
import 'package:sizer/sizer.dart';

class ProfileView extends GetView<ProfileController> {
  ProfileView({Key? key}) : super(key: key);

  final ProfileController profileController = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return const MyProfileView();
  }
}

class MyProfileView extends StatefulWidget {
  const MyProfileView({super.key});

  @override
  State<MyProfileView> createState() => _MyProfileViewState();
}

class _MyProfileViewState extends State<MyProfileView> {
  final _profileController = ProfileController.profileController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppStyle.backgroundColor,
      appBar: AppBar(
          elevation: 0.8,
          backgroundColor: AppStyle.backgroundColor,
          title: Row(
            children: [
              Icon(
                Icons.person,
                color: AppStyle.secondColor,
                size: 3.5.h,
              ),
              SizedBox(
                width: 3.w,
              ),
              Text(
                "Profile",
                style: TextStyle(color: AppStyle.secondColor),
              ),
            ],
          )),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              profilePicture(),
              SizedBox(height: 1.h),
              SizedBox(
                width: 80.w,
                height: 40.h,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 100.w,
                        child: Text(
                          "Nama Lengkap",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: AppStyle.tirtaColor, fontSize: 12.sp),
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: AppStyle.tirtaOnActiveColor),
                          height: 7.h,
                          width: 100.w,
                          padding: const EdgeInsets.only(right: 20, left: 20),
                          child: TextFormField(
                            controller: _profileController
                                .profileNameTextEditController,
                            textCapitalization: TextCapitalization.words,
                            keyboardType: TextInputType.name,
                            style: TextStyle(
                                fontSize: 14, color: AppStyle.tirtaColor),
                            textAlign: TextAlign.start,
                            textAlignVertical: TextAlignVertical.center,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                          )),
                      SizedBox(height: 1.h),
                      SizedBox(
                        width: 100.w,
                        child: Text(
                          "Bio",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: AppStyle.tirtaColor, fontSize: 12.sp),
                        ),
                      ),
                      Container(
                        height: 7.h,
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        decoration:
                            BoxDecoration(color: AppStyle.tirtaOnActiveColor),
                        child: TextFormField(
                          controller:
                              _profileController.profileBioTextEditController,
                          textCapitalization: TextCapitalization.sentences,
                          keyboardType: TextInputType.name,
                          style: TextStyle(
                              fontSize: 12.sp, color: AppStyle.tirtaColor),
                          textAlign: TextAlign.start,
                          textAlignVertical: TextAlignVertical.center,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppStyle.primaryColor,
                    ),
                    onPressed: () {
                      _profileController.addNewProfile(
                          _profileController.profileNameTextEditController.text,
                          _profileController.profileBioTextEditController.text);
                    },
                    child: Text(
                      "SAVE",
                      style: TextStyle(color: AppStyle.secondColor),
                    ),
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppStyle.primaryColor,
                    ),
                    onPressed: () {},
                    child: Text(
                      "DISCARD",
                      style: TextStyle(color: AppStyle.secondColor),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column profilePicture() {
    return Column(
      children: [
        _profileController.imageFile == null
            ? defaultPicture()
            : Container(
                height: 20.h,
                width: 40.w,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: FileImage(
                            File(_profileController.imageFile!.path)))),
              ),
        SizedBox(
          height: 0.5.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () async {
                  await _profileController.pickImageFileFromGallery();
                  setState(() {
                    _profileController.imageFile;
                  });
                },
                icon: Icon(
                  Icons.photo_size_select_actual_rounded,
                  color: AppStyle.primaryColor,
                  size: 4.h,
                )),
            IconButton(
                onPressed: () async {
                  await _profileController.pickImageFileFromCamera();
                  setState(() {
                    _profileController.imageFile;
                  });
                },
                icon: Icon(
                  Icons.camera_alt,
                  color: AppStyle.primaryColor,
                  size: 4.h,
                )),
          ],
        )
      ],
    );
  }

  CircleAvatar defaultPicture() {
    return CircleAvatar(
      radius: 80,
      backgroundImage:
          const AssetImage("lib/app/data/assets/images/avatarProfile.jpg"),
      backgroundColor: AppStyle.backgroundColor,
    );
  }
}

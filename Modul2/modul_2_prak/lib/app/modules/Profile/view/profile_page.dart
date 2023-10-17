// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modul_2_prak/app/modules/Profile/controllers/profile_controller.dart';
import 'package:modul_2_prak/style/AppStyle.dart';
import 'package:sizer/sizer.dart';

class ProfileView extends GetView<ProfileController> {
  ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MyProfileView();
  }
}

class MyProfileView extends StatefulWidget {
  const MyProfileView({super.key});

  @override
  State<MyProfileView> createState() => _MyProfileViewState();
}

class _MyProfileViewState extends State<MyProfileView> {
  get _profileController => ProfileController.profileController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              children: [
                _profileController.imageFile == null
                    ? CircleAvatar(
                        radius: 80,
                        backgroundImage: const AssetImage(
                            "lib/app/data/assets/images/avatarProfile.jpg"),
                        backgroundColor: AppStyle.backgroundColor,
                      )
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
            ),
            SizedBox(height: 1.h),
            Container(
              color: Colors.red,
              height: 8.h,
              width: 100.w,
            ),
            SizedBox(height: 1.h),
            Container(
              color: Colors.red,
              height: 8.h,
              width: 100.w,
            ),
            SizedBox(height: 1.h),
            Container(
              color: Colors.red,
              height: 8.h,
              width: 100.w,
            )
          ],
        ),
      ),
    );
  }
}

// class ProfileView extends StatelessWidget {
//   const ProfileView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MyProfileView();
//   }
// }

// class MyProfileView extends StatefulWidget {
//   const MyProfileView({super.key});

//   @override
//   State<MyProfileView> createState() => _MyProfileViewState();
// }

// class _MyProfileViewState extends State<MyProfileView> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppStyle.backgroundColor,
//       appBar: AppBar(
//           elevation: 0.8,
//           backgroundColor: AppStyle.backgroundColor,
//           title: Row(
//             children: [
//               Icon(
//                 Icons.person,
//                 color: AppStyle.secondColor,
//                 size: 3.5.h,
//               ),
//               SizedBox(
//                 width: 3.w,
//               ),
//               Text(
//                 "Profile",
//                 style: TextStyle(color: AppStyle.secondColor),
//               ),
//             ],
//           )),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Column(
//               children: [
//                 SizedBox(
//                   width: 40.w,
//                   height: 20.h,
//                   child: CircleAvatar(
//                     radius: 80,
//                     backgroundImage: const AssetImage(
//                         "lib/app/data/assets/images/avatarProfile.jpg"),
//                     backgroundColor: AppStyle.backgroundColor,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 0.5.h,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     IconButton(
//                         onPressed: () {},
//                         icon: Icon(
//                           Icons.photo_size_select_actual_rounded,
//                           color: AppStyle.primaryColor,
//                           size: 4.h,
//                         )),
//                     IconButton(
//                         onPressed: () {},
//                         icon: Icon(
//                           Icons.camera_alt,
//                           color: AppStyle.primaryColor,
//                           size: 4.h,
//                         )),
//                   ],
//                 )
//               ],
//             ),
//             SizedBox(height: 1.h),
//             Container(
//               color: Colors.red,
//               height: 8.h,
//               width: 100.w,
//             ),
//             SizedBox(height: 1.h),
//             Container(
//               color: Colors.red,
//               height: 8.h,
//               width: 100.w,
//             ),
//             SizedBox(height: 1.h),
//             Container(
//               color: Colors.red,
//               height: 8.h,
//               width: 100.w,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// class MyProfileView extends  {
//   MyProfileView({Key? key}) : super(key: key);

//   var _profileController = ProfileController.profileController;

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<ProfileController>(builder: (controller) {
//       return Scaffold(
//         backgroundColor: AppStyle.backgroundColor,
//         appBar: AppBar(
//             backgroundColor: AppStyle.backgroundColor,
//             title: Text(
//               "Profile",
//               style: TextStyle(color: AppStyle.secondColor),
//             )),
//         body: const Padding(
//           padding: EdgeInsets.all(20),
//           child: Column(),
//         ),
//       );
//     });
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prak_modul_1/style/AppStyle.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyProfile(),
    );
  }
}

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.backgroundColor,
      appBar: AppBar(
          backgroundColor: AppStyle.backgroundColor,
          leading: IconButton(
              onPressed: () {
                Get.reset();
              },
              icon: Icon(Icons.arrow_back_ios)),
          title: Text("Profile")),
    );
  }
}

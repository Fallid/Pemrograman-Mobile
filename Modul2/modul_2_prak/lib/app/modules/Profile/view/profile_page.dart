import 'package:flutter/material.dart';
import '../../../../style/AppStyle.dart';

class ProfieView extends StatelessWidget {
  const ProfieView({super.key});

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
          title: Text(
            "Profile",
            style: TextStyle(color: AppStyle.secondColor),
          )),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: Column(),
      ),
    );
  }
}

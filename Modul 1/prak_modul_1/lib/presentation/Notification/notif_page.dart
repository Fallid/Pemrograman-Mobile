import 'package:flutter/material.dart';
import 'package:prak_modul_1/style/AppStyle.dart';

class NotifPage extends StatelessWidget {
  const NotifPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyNotif(),
    );
  }
}

class MyNotif extends StatefulWidget {
  const MyNotif({super.key});

  @override
  State<MyNotif> createState() => _MyNotifState();
}

class _MyNotifState extends State<MyNotif> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppStyle.backgroundColor,
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
        title: Text("Notification"),
      ),
    );
  }
}

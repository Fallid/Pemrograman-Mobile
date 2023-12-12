import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/signup');
              },
              child: const Text("Sign Up Page"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/users');
              },
              child: const Text("Users Page"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/realtime');
              },
              child: const Text("Realtime Page"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/storage');
              },
              child: const Text("Image Page"),
            ),
          ],
        ),
      ),
    );
  }
}

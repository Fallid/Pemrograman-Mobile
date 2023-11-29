import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:modul_5_latihan/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      // body: const Center(
      //   child: Text(
      //     'HomeView is working',
      //     style: TextStyle(fontSize: 20),
      //   ),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.SIGNUP);
              },
              child: const Text("Sign Up Page"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.USER);
              },
              child: const Text("Users Page"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.REALTIME);
              },
              child: const Text("Realtime Page"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.SIGNUP);
              },
              child: const Text("Image Page"),
            ),
          ],
        ),
      ),
    );
  }
}

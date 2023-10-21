import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modul_3_latihan/app/modules/home/controllers/home_controller.dart';

import 'package:modul_3_latihan/app/data/api/api_response.dart/todo.dart';
import 'package:modul_3_latihan/app/routes/app_pages.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fetch Data Example'),
      ),
      body: Center(
        child: FutureBuilder<Todos>(
          builder: (context, snapshot) {
            var state = snapshot.connectionState;
            if (state != ConnectionState.done) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (snapshot.hasData) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SizedBox(
                          height: 30,
                          width: double.infinity,
                          child: Text("User Id: ${snapshot.data!.userId}")),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                          width: double.infinity,
                          child: Text("Id: ${snapshot.data!.id}")),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                          width: double.infinity,
                          child: Text("Title: ${snapshot.data!.title}")),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                          width: double.infinity,
                          child: Text("Complete: ${snapshot.data!.completed}")),
                      const SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Get.toNamed(Routes.WEBVIEW);
                          },
                          child: const Text("Go to webview page"))
                    ],
                  ),
                );
              } else if (snapshot.hasError) {
                return Center(child: Text("${snapshot.error}"));
              } else {
                return const Text('');
              }
            }
          },
          future: controller.futureTodos,
        ),
      ),
    );
  }
}

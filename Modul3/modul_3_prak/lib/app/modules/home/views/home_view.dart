import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:modul_3_prak/app/data/api/api_response.dart';

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
      body: Center(
          child: FutureBuilder(
              future: controller.fetchNews(),
              builder: (context, snapshot) {
                var state = snapshot.connectionState;
                if (state != ConnectionState.done) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  if (snapshot.hasData) {
                    // List<Article>? articles = snapshot.data;
                    return Text("Success!");
                    // ListView.builder(
                    //   itemBuilder: (context, index) {
                    //     ListTile(
                    //       title: Text(articles![index].title),
                    //     );
                    //   },
                    //   itemCount: articles?.length,
                    // );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text("${snapshot.error}"),
                    );
                  } else {
                    return const Text("data");
                  }
                }
              })),
    );
  }
}

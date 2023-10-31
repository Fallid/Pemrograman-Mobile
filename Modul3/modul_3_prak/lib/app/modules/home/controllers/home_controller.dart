import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:modul_3_prak/app/data/api/api_response.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  final baseUrl =
      "https://newsapi.org/v2/top-headlines?country=id&apiKey=8849ce4f79484316bb3d4e00adfd54ef";
  final count = 0.obs;
  @override
  void onInit() async {
    super.onInit();
    await fetchNews();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<List<Article>> fetchNews() async {
    var response = await get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      List<dynamic> body = json['articles'];
      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();
      return articles;
    } else {
      throw Exception('Failed to load articel');
    }
  }

  void increment() => count.value++;
}

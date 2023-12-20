import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';
import 'package:modul_4_prak/app/data/api/api_service.dart';

class DashboardController extends GetxController {
  static DashboardController dashboardController = Get.find();
  String baseUrl =
      "https://newsapi.org/v2/top-headlines?country=id&apiKey=8849ce4f79484316bb3d4e00adfd54ef";
  final storage = GetStorage();
  late Future<List<Article>> futureNews;
  @override
  void onInit() async {
    super.onInit();
    futureNews = fetchNews();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  setUrlNews(String url) async {
    await storage.write("urlNews", url);
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
}

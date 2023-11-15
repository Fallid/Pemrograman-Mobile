import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';
import 'package:modul_4_latihan/app/data/api/api_service.dart';

class NewsController extends GetxController {
  final storage = GetStorage();
  int pages = 1;
  Rx<Future<List<Article>>> futureNews = Future.value(<Article>[]).obs;

  @override
  void onInit() {
    super.onInit();
    fetchNews();
  }

  void fetchNextPage() {
    pages++; // Increment the page number to fetch the next page
    fetchNews(); // Call the method to fetch news for the updated page
  }

  void fetchPrevPage() {
    pages--; // Increment the page number to fetch the next page
    fetchNews(); // Call the method to fetch news for the updated page
  }

  void fetchNews() {
    futureNews.value = _fetchNews(pages);
  }

  Future<List<Article>> _fetchNews(int page) async {
    int pages = page;
    try {
      var response = await get(Uri.parse(
          "https://newsapi.org/v2/top-headlines?country=id&pagesize=5&page=$pages&apiKey=8849ce4f79484316bb3d4e00adfd54ef"));

      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        List<dynamic> body = json['articles'];
        List<Article> articles =
            body.map((dynamic item) => Article.fromJson(item)).toList();
        return articles;
      } else {
        throw Exception('Failed to load article');
      }
    } catch (e) {
      throw Exception('Failed to load article: $e');
    }
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';
import 'package:modul_4_latihan/app/data/api/api_service.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TrendingController extends GetxController {
  late String Url;
  String baseUrl =
      "https://newsapi.org/v2/top-headlines?country=id&apiKey=8849ce4f79484316bb3d4e00adfd54ef";
  late Future<List<Article>> futureNews;
  String urlNews = GetStorage().read("urlNews");
  @override
  void onInit() {
    super.onInit();
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

  String getUrl(String url) {
    return Url = url;
  }

  var controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..loadRequest(Uri.parse(GetStorage().read("urlNews")));
  // ganti url di atas menjadi url website yang ingin kalian tampilkan
}

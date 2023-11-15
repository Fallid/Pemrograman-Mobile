import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:modul_3_latihan/app/data/api/api_response.dart/todo.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  //TODO: Implement HomeController
  static const String _baseUrl = "https://jsonplaceholder.typicode.com/todos/5";
  final count = 0.obs;
  final dio = Dio();
  @override
  void onInit() async {
    super.onInit();
    await fetchTodos();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<Todos> fetchTodos() async {
    // final response = await dio.get(_baseUrl);
    var response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      return Todos.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }

  void increment() => count.value++;
}

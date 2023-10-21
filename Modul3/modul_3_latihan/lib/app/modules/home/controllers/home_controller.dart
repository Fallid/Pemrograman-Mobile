import 'dart:convert';

import 'package:get/get.dart';
import 'package:modul_3_latihan/app/data/api/api_response.dart/todo.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  late Future<Todos> futureTodos;

  @override
  void onInit() {
    super.onInit();
    futureTodos = fetchTodos();
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
    var response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/todos/5'));
    if (response.statusCode == 200) {
      return Todos.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }

  void increment() => count.value++;
}

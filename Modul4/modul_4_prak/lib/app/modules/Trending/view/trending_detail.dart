import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modul_4_prak/app/modules/Trending/controllers/trending_controller.dart';
import 'package:modul_4_prak/style/AppStyle.dart';

import 'package:webview_flutter/webview_flutter.dart';

class TrendingView extends GetView<TrendingController> {
  const TrendingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppStyle.backgroundColor,
        title: const Text("News Website"),
      ),
      body: WebViewWidget(controller: controller.controller),
    );
  }
}

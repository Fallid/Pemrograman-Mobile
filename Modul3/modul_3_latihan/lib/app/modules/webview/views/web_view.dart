import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modul_3_latihan/app/modules/webview/controllers/web_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebView extends GetView<WebController> {
  const WebView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WebView Example'),
      ),
      body:
          // Container()
          WebViewWidget(controller: controller.controller),
    );
  }
}

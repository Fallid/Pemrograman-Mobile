import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modul_4_prak/app/modules/Discussion/controller/discussion_controller.dart';

class DisucssionView extends GetView<DiscussionController> {
  const DisucssionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Text("Ini create discussion"),
    );
  }
}

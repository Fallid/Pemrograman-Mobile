import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modul_4_prak/app/Routes/app_pages.dart';
import 'package:modul_4_prak/app/modules/Forum/controllers/forum_controller.dart';
import 'package:modul_4_prak/app/modules/Forum/view/forum_item.dart';
import 'package:modul_4_prak/style/AppStyle.dart';

class ForumView extends StatefulWidget {
  const ForumView({super.key});

  @override
  State<ForumView> createState() => _ForumViewState();
}

class _ForumViewState extends State<ForumView> {
  final controller = Get.put(ForumController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppStyle.backgroundColor,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Get.offAllNamed(Routes.DASHBOARD);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: AppStyle.secondColor,
            )),
        title: Text(
          "Forums",
          style: TextStyle(color: AppStyle.secondColor),
        ),
      ),
      body: ListView(
        children: [
          Container(
            height: null,
            child: Obx(
              () => controller.db.disscussion.isNotEmpty == true
                  ? ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: controller.db.disscussion.length,
                      itemBuilder: (context, index) {
                        final disscussion = controller.db.disscussion[index];
                        return ForumItem(
                          title: disscussion.data["Title"].toString(),
                          description:
                              disscussion.data["Description"].toString(),
                          id: disscussion.$id.toString(),
                        );
                      },
                    )
                  : Center(
                      child: Text('No articles available'),
                    ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.DISCUSSION);
        },
        backgroundColor: AppStyle.primaryColor,
        child: const Icon(Icons.add),
      ),
    );
  }
}

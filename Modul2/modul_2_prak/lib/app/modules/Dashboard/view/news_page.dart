import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modul_2_prak/app/modules/Dashboard/view/news_content.dart';
import 'package:modul_2_prak/app/routes/app_pages.dart';
import 'package:modul_2_prak/style/AppStyle.dart';
import 'package:sizer/sizer.dart';
import 'widget_content.dart';

class NewsView extends StatefulWidget {
  const NewsView({
    super.key,
  });

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppStyle.backgroundColor,
        appBar: AppBar(
          toolbarHeight: 10.h,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 1.h,
              ),
              AppStyle.titleAppBar,
              SizedBox(
                height: 1.h,
              ),
              AppStyle.timeDate,
              SizedBox(
                height: 1.h,
              )
            ],
          ),
          actions: [
            Container(
                width: 5.w,
                margin: const EdgeInsets.only(right: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(color: AppStyle.tirtaColor),
                ),
                child: IconButton(
                  onPressed: () {
                    Get.toNamed(Routes.NOTIFICATION);
                  },
                  icon: Icon(Icons.notifications_none,
                      color: AppStyle.secondColor),
                ))
          ],
          backgroundColor: AppStyle.backgroundColor,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [ContentNewsCategory()],
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modul_2_prak/app/routes/app_pages.dart';
import 'package:modul_2_prak/style/AppStyle.dart';
import 'package:sizer/sizer.dart';
import 'widget_content.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    super.key,
  });

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppStyle.backgroundColor,
        appBar: AppBar(
          toolbarHeight: 12.5.h,
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
            children: [
              Padding(
                padding: EdgeInsets.all(3.w),
                child: Column(children: [
                  const ContentButton(),
                  SizedBox(
                    height: 4.h,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Following",
                            style: TextStyle(
                                color: AppStyle.secondColor,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          TextButton(
                              onPressed: () {
                                Get.toNamed(Routes.NEWS);
                              },
                              child: Text(
                                "View more",
                                style: TextStyle(
                                    color: AppStyle.primaryColor, fontSize: 14),
                              ))
                        ],
                      ),
                    ],
                  ),
                ]),
              ),
              CategoryButtons(),
              ContentCategory()
            ],
          ),
        ));
  }
}

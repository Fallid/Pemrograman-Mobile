import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prak_modul_1/style/AppStyle.dart';
import 'package:sizer/sizer.dart';

class NotifPage extends StatelessWidget {
  const NotifPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyNotif(),
    );
  }
}

class MyNotif extends StatefulWidget {
  const MyNotif({super.key});

  @override
  State<MyNotif> createState() => _MyNotifState();
}

class _MyNotifState extends State<MyNotif> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppStyle.backgroundColor,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios)),
        title: const Text("Notification"),
      ),
      body: const Padding(
        padding: EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              NewsContain(),
              NewsContain(),
              NewsContain(),
              NewsContain(),
              NewsContain(),
              NewsContain(),
              NewsContain(),
              NewsContain(),
              NewsContain(),
              NewsContain(),
            ],
          ),
        ),
      ),
    );
  }
}

class NewsContain extends StatelessWidget {
  const NewsContain({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20.0),
      color: AppStyle.backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
              width: 100.w,
              child: Text(
                "Technology",
                style: TextStyle(color: AppStyle.tirtaColor),
              )),
          SizedBox(
            height: 1.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 50.w,
                height: 12.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Why you can't have legs in virtual reality (yet)",
                      textAlign: TextAlign.start,
                      textWidthBasis: TextWidthBasis.parent,
                      style: TextStyle(
                          color: AppStyle.secondColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          child: Row(
                            children: [
                              Icon(
                                Icons.watch_later_outlined,
                                size: 14.sp,
                                color: AppStyle.tirtaColor,
                              ),
                              Text(
                                "14h ago",
                                style: TextStyle(color: AppStyle.tirtaColor),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                            child: Row(
                          children: [
                            Icon(
                              Icons.chat_bubble_outline,
                              size: 14.sp,
                              color: AppStyle.tirtaColor,
                            ),
                            Text(
                              "23",
                              style: TextStyle(color: AppStyle.tirtaColor),
                            )
                          ],
                        )),
                      ],
                    )
                  ],
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  "lib/app/data/assets/images/virtualreality.jpg",
                  height: 10.h,
                  fit: BoxFit.cover,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

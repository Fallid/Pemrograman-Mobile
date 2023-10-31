import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modul_2_prak/app/Routes/app_pages.dart';
import 'package:modul_2_prak/app/data/api/api_service.dart';
import 'package:modul_2_prak/app/modules/Dashboard/controllers/dashboard_controller.dart';
import 'package:modul_2_prak/app/modules/Dashboard/controllers/news_controllers.dart';
import 'package:modul_2_prak/style/AppStyle.dart';
import 'package:sizer/sizer.dart';

class ContentNewsButton extends GetView<DashboardController> {
  const ContentNewsButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: controller.futureNews,
        builder: (context, snapshot) {
          var state = snapshot.connectionState;
          if (state != ConnectionState.done) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (snapshot.hasData) {
              List<Article>? articles = snapshot.data;
              int index = 1;
              return InkWell(
                onTap: () {
                  Get.toNamed(Routes.TRENDING);
                },
                child: Column(
                  children: [
                    Stack(children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                            "lib/app/data/assets/images/photoTrending.jpg"),
                      ),
                      Container(
                          alignment: const Alignment(-0.85, -0.55),
                          height: 20.h,
                          child: Container(
                            padding:
                                EdgeInsets.fromLTRB(1.7.h, 1.h, 1.7.h, 1.h),
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(20)),
                            child: Text(
                              "Trending",
                              style: TextStyle(
                                color: AppStyle.secondColor,
                              ),
                            ),
                          )),
                    ]),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      articles![index].title,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "World",
                          style: TextStyle(color: AppStyle.tirtaColor),
                        ),
                        SizedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.watch_later_outlined,
                                color: AppStyle.tirtaColor,
                                size: 16,
                              ),
                              SizedBox(
                                width: 1.w,
                              ),
                              Text(
                                "${articles[index].publishedAt.hour} ago",
                                style: TextStyle(color: AppStyle.tirtaColor),
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              Icon(
                                Icons.chat_bubble_outline,
                                color: AppStyle.tirtaColor,
                                size: 16,
                              ),
                              SizedBox(
                                width: 1.w,
                              ),
                              Text(
                                '5',
                                style: TextStyle(color: AppStyle.tirtaColor),
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text("${snapshot.error}"),
              );
            } else {
              return const Center(
                child: Text("Cannot load articles"),
              );
            }
          }
        });
  }
}

class CategoryButtons extends GetView<DashboardController> {
  const CategoryButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        height: 90.h,
        child: Padding(
          padding: EdgeInsets.only(left: 3.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                margin: EdgeInsets.only(right: 3.w),
                height: 4.h,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(AppStyle.secondColor),
                  ),
                  child: Text(
                    "All",
                    style: TextStyle(color: AppStyle.tirtaColor),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 3.w),
                height: 4.h,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(AppStyle.tirtaOnActiveColor),
                  ),
                  child: Text(
                    "Gaming",
                    style: TextStyle(color: AppStyle.tirtaColor),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 3.w),
                height: 4.h,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(AppStyle.tirtaOnActiveColor),
                  ),
                  child: Text(
                    "Business",
                    style: TextStyle(color: AppStyle.tirtaColor),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 3.w),
                height: 4.h,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(AppStyle.tirtaOnActiveColor),
                  ),
                  child: Text(
                    "Crypto",
                    style: TextStyle(color: AppStyle.tirtaColor),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 3.w),
                height: 4.h,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(AppStyle.tirtaOnActiveColor),
                  ),
                  child: Text(
                    "Technology",
                    style: TextStyle(color: AppStyle.tirtaColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ContentNewsCategory extends GetView<NewsController> {
  const ContentNewsCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(3.w),
        child: FutureBuilder(
            future: controller.futureNews,
            builder: (context, snapshot) {
              var state = snapshot.connectionState;
              if (state != ConnectionState.done) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                if (snapshot.hasData) {
                  List<Article>? articles = snapshot.data;
                  return Column(
                    children: [
                      SizedBox(
                        height: 70.h,
                        width: 100.w,
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Column(
                                        children: [
                                          SizedBox(
                                            width: 55.w,
                                            child: Text(
                                              articles![index].title,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.justify,
                                              maxLines: 2,
                                              style: TextStyle(
                                                color: AppStyle.secondColor,
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                          Row(
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.watch_later_outlined,
                                                    size: 14.sp,
                                                    color: AppStyle.tirtaColor,
                                                  ),
                                                  Text(
                                                    "${articles[index].publishedAt.hour} ago",
                                                    style: TextStyle(
                                                        color:
                                                            AppStyle.tirtaColor,
                                                        fontSize: 10.sp),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                width: 10.w,
                                              ),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.chat_bubble_outline,
                                                    size: 14.sp,
                                                    color: AppStyle.tirtaColor,
                                                  ),
                                                  Text(
                                                    "23",
                                                    style: TextStyle(
                                                        fontSize: 10.sp,
                                                        color: AppStyle
                                                            .tirtaColor),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Container(
                                        width: 37.w,
                                        height: 12.h,
                                        alignment: const Alignment(1, -1),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.asset(
                                            "lib/app/data/assets/images/virtualreality.jpg",
                                            width: 30.w,
                                            height: 10.h,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                ],
                              );
                            }),
                      ),
                      ElevatedButton(onPressed: () {}, child: Text("data"))
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text("${snapshot.error}"),
                  );
                } else {
                  return const Text("data");
                }
              }
            }));
  }
}

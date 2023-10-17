import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modul_2_prak/app/routes/app_pages.dart';
import 'package:modul_2_prak/style/AppStyle.dart';
import 'package:sizer/sizer.dart';

class ContentButton extends StatelessWidget {
  const ContentButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: const ButtonStyle(
          overlayColor: MaterialStatePropertyAll(Colors.transparent)),
      onPressed: () {
        Get.toNamed(Routes.NOTIFICATION);
      },
      child: Column(
        children: [
          Stack(children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                "lib/app/data/assets/images/photoTrending.jpg",
              ),
            ),
            Container(
                alignment: const Alignment(-0.85, -0.55),
                height: 20.h,
                child: Container(
                  padding: EdgeInsets.fromLTRB(1.7.h, 1.h, 1.7.h, 1.h),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    "Trending",
                    style: TextStyle(
                      color: AppStyle.secondColor,
                    ),
                  ),
                ))
          ]),
          SizedBox(
            height: 2.h,
          ),
          const Text(
            "We meet online to pray for Ukraine: Kyiv's Anglicans spread across Europe continue to meet",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
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
                      "1h ago",
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
  }
}

class CategoryButtons extends StatelessWidget {
  const CategoryButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
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
    );
  }
}

class ContentCategory extends StatelessWidget {
  const ContentCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(3.w),
      child: Column(children: [
        SizedBox(
          height: 3.h,
        ),
        SizedBox(
          width: 100.w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Technology",
                style: TextStyle(color: AppStyle.tirtaColor, fontSize: 12.sp),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 55.w,
                    child: Column(
                      children: [
                        Text(
                          "Why you can't have legs in virtual reality (yet)",
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
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.watch_later_outlined,
                                  size: 14.sp,
                                  color: AppStyle.tirtaColor,
                                ),
                                Text(
                                  "14h ago",
                                  style: TextStyle(
                                      color: AppStyle.tirtaColor,
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
                                      color: AppStyle.tirtaColor),
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: const Alignment(1, -1),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        "lib/app/data/assets/images/virtualreality.jpg",
                        width: 37.w,
                        height: 12.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 3.h,
              ),
            ],
          ),
        ),
        SizedBox(
          width: 3.w,
        ),
        SizedBox(
          width: 100.w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Technology",
                style: TextStyle(color: AppStyle.tirtaColor, fontSize: 12.sp),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 55.w,
                    child: Column(
                      children: [
                        Text(
                          "Why you can't have legs in virtual reality (yet)",
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
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.watch_later_outlined,
                                  size: 14.sp,
                                  color: AppStyle.tirtaColor,
                                ),
                                Text(
                                  "14h ago",
                                  style: TextStyle(
                                      color: AppStyle.tirtaColor,
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
                                      color: AppStyle.tirtaColor),
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: const Alignment(1, -1),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        "lib/app/data/assets/images/virtualreality.jpg",
                        width: 37.w,
                        height: 12.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 3.h,
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

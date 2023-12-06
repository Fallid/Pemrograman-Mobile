import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:modul_4_prak/app/data/api/user_client.dart';
import 'package:modul_4_prak/style/AppStyle.dart';
import 'package:sizer/sizer.dart';

class ForumItem extends StatelessWidget {
  final String title;
  final String description;

  const ForumItem({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final UserClient db = Get.put(UserClient());

    return GestureDetector(
        onTap: () => (),
        child: Column(
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
                        title,
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
                              "16 ago",
                              style: TextStyle(
                                  color: AppStyle.tirtaColor, fontSize: 10.sp),
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
                                  fontSize: 10.sp, color: AppStyle.tirtaColor),
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
                    borderRadius: BorderRadius.circular(10),
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
            )
          ],
        ));
  }
}

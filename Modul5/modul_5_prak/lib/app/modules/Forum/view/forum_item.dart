import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:modul_4_prak/app/Routes/app_pages.dart';
import 'package:modul_4_prak/app/data/api/user_client.dart';
import 'package:modul_4_prak/app/modules/Forum/controllers/forum_controller.dart';
import 'package:modul_4_prak/style/AppStyle.dart';
import 'package:sizer/sizer.dart';

class ForumItem extends StatelessWidget {
  final String title;
  final String description;
  final String id;

  const ForumItem(
      {super.key,
      required this.title,
      required this.description,
      required this.id});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForumController());

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
                    Container(
                        padding: EdgeInsets.only(left: 3.w),
                        width: 55.w,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.justify,
                              maxLines: 2,
                              style: TextStyle(
                                color: AppStyle.secondColor,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              description,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.justify,
                              maxLines: 2,
                              style: TextStyle(
                                color: AppStyle.secondColor,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        )),
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            IconButton(
                                onPressed: () async {
                                  await controller.deleteDocuments(id);
                                },
                                icon: Icon(Icons.delete))
                          ],
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Row(
                          children: [
                            IconButton(onPressed: () {}, icon: Icon(Icons.edit))
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

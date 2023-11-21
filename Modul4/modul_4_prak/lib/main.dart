import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:modul_4_prak/app/Routes/app_pages.dart';
import 'package:modul_4_prak/app/modules/Register/controllers/register_controller.dart';
import 'package:modul_4_prak/firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await GetStorage.init();
  await Get.putAsync(() async => await SharedPreferences.getInstance());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final RegisterController _authController = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, devicetype) {
      if (kDebugMode) {
        print(_authController.isLoggedIn.value);
      }
      return GetMaterialApp(
        title: "Application",
        initialRoute: _authController.isLoggedIn.value
            ? AppPages.INITIAL
            : AppPages.NOINITIAL,
        getPages: AppPages.routes,
      );
    });
  }
}

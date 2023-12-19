import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:modul_4_prak/app/modules/Login/view/login.dart';
import 'package:modul_4_prak/app/modules/Register/controllers/register_controller.dart';
import 'package:modul_4_prak/style/AppStyle.dart';
import 'package:sizer/sizer.dart';

class RegisterView extends StatefulWidget {
  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _authController = Get.put(RegisterController());

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppStyle.backgroundColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset("lib/app/data/assets/SVG/login_register.svg",
                  width: 60.w),
              SizedBox(
                height: 2.h,
              ),
              SizedBox(
                width: 100.h,
                child: Text(
                  "Hello 👋\nComplete your personal data first!",
                  style:
                      TextStyle(color: AppStyle.secondColor, fontSize: 16.sp),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle:
                        TextStyle(color: AppStyle.secondColor, fontSize: 10.sp),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppStyle.primaryColor),
                        borderRadius: BorderRadius.circular(25)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppStyle.primaryColor),
                        borderRadius: BorderRadius.circular(25))),
                style: TextStyle(color: AppStyle.secondColor, fontSize: 11.sp),
              ),
              SizedBox(
                height: 2.h,
              ),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle:
                        TextStyle(color: AppStyle.secondColor, fontSize: 10.sp),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(color: AppStyle.primaryColor)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppStyle.primaryColor),
                        borderRadius: BorderRadius.circular(25))),
                style: TextStyle(color: AppStyle.secondColor, fontSize: 11.sp),
              ),

              SizedBox(height: 3.h),

              Obx(() {
                return SizedBox(
                  width: 100.w,
                  height: 6.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppStyle.primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25))),
                    onPressed: _authController.isLoading.value
                        ? null
                        : () {
                            _authController.registerUser(
                              _emailController.text,
                              _passwordController.text,
                            );
                          },
                    child: _authController.isLoading.value
                        ? const CircularProgressIndicator()
                        : Text(
                            'Register',
                            style: TextStyle(
                                fontSize: 13.sp, fontWeight: FontWeight.normal),
                          ),
                  ),
                );
              }),

              const SizedBox(height: 20),

              //LOGIN
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style: TextStyle(
                      color: AppStyle.secondColor,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.off(LoginView());
                    },
                    child: Text(
                      "Login ",
                      style: TextStyle(
                        color: AppStyle.primaryColor,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

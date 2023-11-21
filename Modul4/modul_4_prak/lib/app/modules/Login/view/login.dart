import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:modul_4_prak/app/modules/Login/controllers/login_controller.dart';
import 'package:modul_4_prak/app/modules/Register/view/register.dart';
import 'package:modul_4_prak/style/AppStyle.dart';
import 'package:sizer/sizer.dart';

class LoginView extends StatefulWidget {
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _authController = Get.put(LoginController());

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
                  "Hello 👋\nWelcome Back!",
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
                style: TextStyle(fontSize: 11.sp, color: AppStyle.secondColor),
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
                        borderSide: BorderSide(color: AppStyle.primaryColor),
                        borderRadius: BorderRadius.circular(25)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppStyle.primaryColor),
                        borderRadius: BorderRadius.circular(25))),
                style: TextStyle(fontSize: 11.sp, color: AppStyle.secondColor),
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
                            _authController.loginUser(
                              _emailController.text,
                              _passwordController.text,
                            );
                          },
                    child: _authController.isLoading.value
                        ? const CircularProgressIndicator()
                        : Text(
                            'Login',
                            style: TextStyle(
                                fontSize: 13.sp, fontWeight: FontWeight.normal),
                          ),
                  ),
                );
              }),

              const SizedBox(height: 30),

              //SIGN UP
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Dont have an account? ",
                    style: TextStyle(
                      color: AppStyle.secondColor,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.off(RegisterView());
                    },
                    child: Text(
                      "Create ",
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

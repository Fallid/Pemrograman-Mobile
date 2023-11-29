import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modul_5_latihan/app/modules/home/controllers/account_controller.dart';

class SignUpView extends StatelessWidget {
  final AccountController accountController = Get.put(AccountController());

  SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController nameController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up View'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                Map<String, dynamic> map = {
                  'userId': 'unique()',
                  'email': emailController.text,
                  'password': passwordController.text,
                  'name': nameController.text,
                };
                await accountController.createAccount(map);
              },
              child: Text('Create Account'),
            ),
          ],
        ),
      ),
    );
  }
}

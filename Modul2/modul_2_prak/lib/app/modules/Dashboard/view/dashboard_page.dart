import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modul_2_prak/app/modules/Dashboard/controllers/dashboard_controller.dart';
import 'package:modul_2_prak/app/modules/Notification/view/notif_page.dart';
import 'package:modul_2_prak/app/modules/Profile/view/profile_page.dart';
import 'package:modul_2_prak/style/AppStyle.dart';
import 'home_page.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MyDashboard(),
    );
  }
}

class MyDashboard extends StatefulWidget {
  const MyDashboard({super.key});

  @override
  State<MyDashboard> createState() => _MyDashboardState();
}

class _MyDashboardState extends State<MyDashboard> {
  var dateTime = DateTime.now();
  int _selectedIndex = 0;
  final screens = [const HomeView(), NotifView(), NotifView(), ProfileView()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppStyle.backgroundColor,
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        backgroundColor: AppStyle.backgroundColor,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: AppStyle.tirtaColor,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        selectedItemColor: AppStyle.primaryColor,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
              ),
              label: "Search"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.bookmark_border_rounded,
              ),
              label: "List"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: "Profile"),
        ],
      ),
    );
  }
}

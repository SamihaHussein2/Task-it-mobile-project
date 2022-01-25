// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import '/screens/navscreens/settings.dart';
import '/screens/Intro/login.dart';
import '/screens/navscreens/homepage/homepage.dart';
import '/constants/custom_colors.dart';
import 'task/tasks_list.dart';

class MainPageUnregistered extends StatefulWidget {
  const MainPageUnregistered({Key? key}) : super(key: key);

  @override
  _MainPageUnregisteredState createState() => _MainPageUnregisteredState();
}

class _MainPageUnregisteredState extends State<MainPageUnregistered> {
  int currentIndex = 1;
  List navBarPages = [TaskListScreen(), Homepage(), Settings()];

  @override
  Widget build(BuildContext context) {
    // final user = FirebaseAuth.instance.currentUser?.email;
    //final username = FirebaseAuth.instance.currentUser?.displayName;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.Cultured,
        elevation: 0,
        title: Row(
          children: [
            Text('Hello, User!',
                style: TextStyle(color: CustomColors.Midnight, fontSize: 20))
          ],
        ),
      ),
      body: navBarPages[currentIndex],
      bottomNavigationBar: new Theme(
        data: Theme.of(context),
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 10)
                ]),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(30)),
              child: BottomNavigationBar(
                selectedItemColor: CustomColors.Midnight,
                showUnselectedLabels: false,
                currentIndex: currentIndex,
                onTap: (index) => setState(() => currentIndex = index),
                items: const [
                  BottomNavigationBarItem(
                    label: "Tasks",
                    icon: Icon(Icons.apps_rounded, size: 30),
                  ),
                  BottomNavigationBarItem(
                    label: "Home",
                    icon: Icon(Icons.home_rounded, size: 30),
                  ),
                  BottomNavigationBarItem(
                    label: "Settings",
                    icon: Icon(Icons.more_horiz, size: 30),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}

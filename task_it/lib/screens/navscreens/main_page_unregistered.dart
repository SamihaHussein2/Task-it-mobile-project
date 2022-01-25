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
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.dehaze_rounded,
                color: CustomColors.Midnight,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        backgroundColor: CustomColors.Cultured,
        elevation: 0,
        title: Row(
          children: [
            // SizedBox(width: 10),
            Text('Hello, User!',
                style: TextStyle(color: CustomColors.Midnight, fontSize: 20))
          ],
        ),
      ),
      drawer: Drawer(
          child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              decoration: BoxDecoration(color: CustomColors.Midnight),
              child: Text("Welcome To TaskIt!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      height: 5, fontSize: 20, color: CustomColors.Cultured))),
          Divider(
            color: Colors.white,
          ),
          ListTile(
            leading: Icon(
              Icons.login,
              size: 30,
              color: CustomColors.Midnight,
            ),
            title: Text("Login/Register",
                style: TextStyle(
                    height: 1, fontSize: 20, color: CustomColors.Midnight)),
            onTap: () => {
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => Login())),
            },
          ),
          Divider(
            thickness: 1,
            height: 90,
            color: Colors.grey,
          ),
          // ListTile(
          //   leading: Container(
          //     child: ElevatedButton.icon(
          //       icon: Icon(Icons.share_rounded),
          //       onPressed: () {
          //         Share.share(appURL);
          //       },
          //       label: Text("Share App"),
          //       style: ElevatedButton.styleFrom(
          //           shape: new RoundedRectangleBorder(
          //               borderRadius: new BorderRadius.circular(20.0)),
          //           padding: EdgeInsets.all(20),
          //           primary: CustomColors.Midnight),
          //     ),
          //   ),
          // ),
        ],
      )),
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
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => _newTaskDialog(context),
      //   child: Icon(Icons.add_rounded, size: 40),
      //   elevation: 30,
      //   backgroundColor: CustomColors.Midnight,
      // ),
    );
  }

  // void _newTaskDialog(BuildContext context) {
  //   showMaterialModalBottomSheet(
  //       // add button add w add task fi al set state?
  //       elevation: 10,
  //       backgroundColor: Colors.amber,
  //       context: context,
  //       builder: (ctx) => Container(
  //             //width: 100,
  //             height: 800,
  //             color: Colors.white,
  //             alignment: Alignment.center,
  //             child: TasksListScreen(),
  //           ));
  // }
}

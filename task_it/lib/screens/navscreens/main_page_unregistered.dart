import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:share_plus/share_plus.dart';
import '/screens/Intro/login.dart';
import '/screens/navscreens/homepage/homepage.dart';
import '/constants/custom_colors.dart';
import '/screens/add_new_task.dart';
import '/screens/navscreens/tasks_list.dart';

class MainPageUnregistered extends StatefulWidget {
  const MainPageUnregistered({Key? key}) : super(key: key);

  @override
  _MainPageUnregisteredState createState() => _MainPageUnregisteredState();
}

class _MainPageUnregisteredState extends State<MainPageUnregistered> {
  String appURL =
      "https://play.google.com/store/apps/details?id=com.miu.taskit";
  int currentIndex = 0;
  List navBarPages = [Homepage(), TasksListScreen()];

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

          // ListTile(
          //   leading: Icon(Icons.account_circle_rounded),
          //   title: Text("Profile"),
          //   onTap: () => {
          //     Navigator.push(context,
          //         new MaterialPageRoute(builder: (context) => Account()))
          //   },
          // ),
          // ListTile(
          //   leading: Icon(Icons.notifications_active_rounded),
          //   title: Text("Notifications"),
          // ),
          // ListTile(
          //   leading: Icon(Icons.leaderboard_rounded),
          //   title: Text("Leaderboard"),
          //   onTap: () => {
          //     Navigator.push(
          //         context,
          //         new MaterialPageRoute(
          //             builder: (context) => LeaderBoardScreen()))
          //   },
          // ),
          Divider(
            thickness: 1,
            height: 90,
            color: Colors.grey,
          ),
          ListTile(
            leading: Container(
              child: ElevatedButton.icon(
                icon: Icon(Icons.share_rounded),
                onPressed: () {
                  Share.share(appURL);
                },
                label: Text("Share App"),
                style: ElevatedButton.styleFrom(
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0)),
                    padding: EdgeInsets.all(20),
                    primary: CustomColors.Midnight),
              ),
            ),
          ),
          // ListTile(
          //   leading: Icon(Icons.toggle_on_rounded),
          //   title: Text("Theme"),
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
                currentIndex: currentIndex,
                onTap: (index) => setState(() => currentIndex = index),
                items: [
                  BottomNavigationBarItem(
                    label: "Home",
                    icon: Icon(Icons.home_rounded, size: 30),
                  ),
                  BottomNavigationBarItem(
                    label: "Tasks",
                    icon: Icon(Icons.apps_rounded, size: 30),
                  ),
                ],
              ),
            )),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _show(context),
        child: Icon(Icons.add_rounded, size: 40),
        elevation: 30,
        backgroundColor: CustomColors.Midnight,
      ),
    );
  }

  void _show(BuildContext ctx) {
    showMaterialModalBottomSheet(
        // add button add w add task fi al set state?
        elevation: 10,
        backgroundColor: Colors.amber,
        context: ctx,
        builder: (ctx) => Container(
              //width: 100,
              height: 800,
              color: Colors.white,
              alignment: Alignment.center,
              child: AddTaskForm(),
            ));
  }
}

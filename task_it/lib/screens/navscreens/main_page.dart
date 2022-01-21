// Flutter Packages
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

// App Files
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '/screens/navscreens/homepage/homepage.dart';
import '/constants/custom_colors.dart';
import '/screens/add_new_task.dart';
import '/screens/navscreens/tasks_list.dart';
import '/screens/leaderboard/leaderboard.dart';
import '/screens/user_account.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String appURL =
      "https://play.google.com/store/apps/details?id=com.miu.taskit";
  int currentIndex = 0;
  List navBarPages = [Homepage(), TasksList()];

  @override
  Widget build(BuildContext context) {
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
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: CustomColors.Midnight),
            accountName: Text('Salma Tamer'),
            accountEmail: Text('salma12@gmail.com'),
            currentAccountPicture: CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage("assets/avatar/avatar.jpg"),
            ),
          ),
          Divider(
            color: Colors.white,
          ),
          ListTile(
            leading: Icon(Icons.account_circle_rounded),
            title: Text("Profile"),
            onTap: () => {
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => Account()))
            },
          ),
          ListTile(
            leading: Icon(Icons.notifications_active_rounded),
            title: Text("Notifications"),
          ),
          ListTile(
            leading: Icon(Icons.leaderboard_rounded),
            title: Text("Leaderboard"),
            onTap: () => {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => LeaderBoardScreen()))
            },
          ),
          Divider(
            thickness: 1,
            height: 90,
            color: Colors.grey,
          ),
          ListTile(
              leading: IconButton(
                icon: Icon(Icons.share),
                onPressed: () {
                  Share.share(appURL);
                },
              ),
              title: Text("Share App")),
          ListTile(
            leading: Icon(Icons.toggle_on_rounded),
            title: Text("Theme"),
          ),
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
              height: 500,
              color: Colors.white,
              alignment: Alignment.center,
              child: AddTaskForm(),
            ));
  }

  void _shareURL() {
    Share.share(appURL);
  }
}

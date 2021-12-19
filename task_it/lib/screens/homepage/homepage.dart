import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '/screens/lists_page.dart';
import '/screens/user_account.dart';
import '/components/custom_colors.dart';
import '/screens/homepage/widgets/default_tasks.dart';
import '/screens/homepage/widgets/unlock_more_features.dart';
import '/screens/leaderboard/leaderboard.dart';
import '/screens/add_new_task.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.Cultured,
      appBar: _buildAppBar(context),
      drawer: _buildDrawer(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UnlockMoreFeatures(),
          Container(
            padding: EdgeInsets.all(15),
            child: Text('Tasks',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          ),
          Expanded(
            child: DefaultTasks(),
          )
        ],
      ),
      bottomNavigationBar: _buildBottomNavBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _show(context),
        child: Icon(Icons.add_rounded, size: 40),
        elevation: 30,
        backgroundColor: CustomColors.Midnight,
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
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
          backgroundColor: CustomColors.Cultured,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          selectedItemColor: CustomColors.Midnight,
          items: [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(Icons.home_rounded, size: 30),
            ),
            BottomNavigationBarItem(
              label: "Tasks",
              icon: IconButton(
                icon: Icon(Icons.widgets_rounded, size: 30),
                onPressed: () => TaskList(),
              ),
            )
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(context) {
    return AppBar(
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(
              Icons.more_vert,
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

  Drawer _buildDrawer(BuildContext context) {
    return Drawer(
        child: ListView(
      padding: EdgeInsets.zero,
      children: [
        UserAccountsDrawerHeader(
          decoration: BoxDecoration(color: CustomColors.Midnight),
          accountName: Text('John Doe'),
          accountEmail: Text('johndoe@gmail.com'),
          currentAccountPicture: CircleAvatar(
              backgroundColor: CustomColors.Cultured,
              child: Icon(
                Icons.person_rounded,
                color: CustomColors.Midnight,
              )),
        ),
        Divider(
          color: Colors.white,
        ),
        ListTile(
          leading: Icon(Icons.account_circle_rounded),
          title: Text("Profile"),
          onTap: () => {
            Navigator.push(
                context, new MaterialPageRoute(builder: (context) => Account()))
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
          leading: Icon(Icons.share_rounded),
          title: Text("Invite Friends"),
        ),
        ListTile(
          leading: Icon(Icons.toggle_on_rounded),
          title: Text("Theme"),
        ),
      ],
    ));
  }
}

import 'package:flutter/material.dart';

import '/utils/custom_colors.dart';
import '/utils/bottom_navigator.dart';

class Homepage extends StatefulWidget {
  // final FirebaseUser user;
  // Homepage({Key? key, this.user}) : super(key: key);

  Homepage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomepageState();
}

class TaskItApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Task It",
      home: Homepage(),
      theme: new ThemeData(primarySwatch: Colors.blue),
    );
  }
}

class _HomepageState extends State<Homepage> {
  final bottomNavBarIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: MyAppBar(
      //   appBar: AppBar(),
      //   widgets: <Widget>[Icon(Icons.more_vert)],
      // ),
      body: Container(
        margin: EdgeInsets.fromLTRB(20, 0, 20, 15),
        padding: EdgeInsets.fromLTRB(5, 13, 5, 13),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            stops: [0.015, 0.015],
            colors: [CustomColors.GreenIcon, Colors.white],
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigator(context, bottomNavBarIndex),
    );
  }
}

import 'package:flutter/material.dart';

import '/utils/custom_colors.dart';
import '/utils/bottom_navigator.dart';

class Homepage extends StatefulWidget {
  Homepage({Key? key}) : super(key: key);

  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final bottomNavBarIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

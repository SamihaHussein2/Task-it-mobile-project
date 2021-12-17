import 'package:flutter/material.dart';
import '/enums.dart';
import '/components/bottom_nav_bar.dart';

class Homepage extends StatelessWidget {
  static String routeName = "/homepage";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Homepage'),
      bottomNavigationBar: BottomNavBar(selectedMenu: NavBarMenu.homepage),
    );
  }
}

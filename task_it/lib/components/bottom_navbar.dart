import 'package:flutter/material.dart';
import '/screens/homepage/homepage.dart';
import '/screens/new_task.dart';
import '/screens/tasks.dart';

class BottomNavBarItem {
  final Widget page;
  final Widget pageTitle;
  final Icon pageIcon;

  BottomNavBarItem(
      {required this.page, required this.pageTitle, required this.pageIcon});

  static List<BottomNavBarItem> get items => [
        BottomNavBarItem(
          page: Homepage(),
          pageIcon: Icon(Icons.home),
          pageTitle: Text("Home"),
        ),
        BottomNavBarItem(
          page: NewTask(),
          pageIcon: Icon(Icons.add_circle_outline_rounded),
          pageTitle: Text("New Task"),
        ),
        BottomNavBarItem(
          page: Tasks(),
          pageIcon: Icon(Icons.widgets_rounded),
          pageTitle: Text("Tasks"),
        ),
      ];
}

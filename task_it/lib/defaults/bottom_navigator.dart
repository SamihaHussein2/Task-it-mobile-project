import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '/widgets/placeholder_widget.dart';

class BottomNavigator extends StatefulWidget {
  @override
  State createState() {
    return _BottomNavigatorState();
  }
}

class _BottomNavigatorState extends State {
  int _currentIndex = 0; //to track the index of the currently selected tab
  final List _children = [
    PlaceholderWidget(Colors.white), //home
    PlaceholderWidget(Colors.blue), //add
    PlaceholderWidget(Colors.green), //tasks
  ]; //list of widgets to render based on the selected tab

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              title: new Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.add),
            ),
            BottomNavigationBarItem(
                icon: new Icon(Icons.category_outlined),
                title: new Text('Tasks'))
          ]),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}

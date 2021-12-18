import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'bottom_navbar.dart';

class BottomNavBarPages extends StatefulWidget {
  int selectedTabIndex = 0;
  BottomNavBarPages({required this.selectedTabIndex});

  @override
  _BottomNavBarPagesState createState() => _BottomNavBarPagesState();
}

class _BottomNavBarPagesState extends State<BottomNavBarPages> {
  int _selectedTabIndex = 0;

  void _onSelectedTab(int index) {
    setState(() {
      widget.selectedTabIndex = index;
      _selectedTabIndex = widget.selectedTabIndex;
      print(_selectedTabIndex);
    });
  }

  @override
  void initState() {
    _onSelectedTab(widget.selectedTabIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        body: IndexedStack(
          index: widget.selectedTabIndex,
          children: [
            for (final navBarItem in BottomNavBarItem.items) navBarItem.page,
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline_rounded),
            title: Text("New Task"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.widgets_rounded),
            title: Text("Tasks"),
          ),
        ],
        currentIndex: _selectedTabIndex,
        selectedItemColor: HexColor("#1E4E5F"),
        onTap: _onSelectedTab,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '/screens/homepage.dart';
import 'custom_colors.dart';

class BottomNavigator extends StatelessWidget {
  final int bottomNavBarIndex;
  final BuildContext context;
  const BottomNavigator(this.context, this.bottomNavBarIndex);

  void onSelectedTab(int index) {
    Navigator.of(context).push(
      MaterialPageRoute<Null>(builder: (BuildContext context) {
        return Homepage();
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: bottomNavBarIndex,
      type: BottomNavigationBarType.fixed,
      selectedFontSize: 10,
      selectedLabelStyle: TextStyle(color: CustomColors.BlueDark),
      selectedItemColor: CustomColors.BlueDark,
      unselectedFontSize: 10,
      items: [
        BottomNavigationBarItem(
          icon: Container(
            margin: EdgeInsets.only(bottom: 5),
            child: Icon(Icons.home),
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Container(
            margin: EdgeInsets.only(bottom: 5),
            child: Icon(Icons.add_rounded),
          ),
          label: 'Add New Task',
        ),
        BottomNavigationBarItem(
          icon: Container(
            margin: EdgeInsets.only(bottom: 5),
            child: Icon(Icons.group_work_outlined),
          ),
          label: 'Tasks',
        ),
      ],
      onTap: onSelectedTab,
    );
  }
}

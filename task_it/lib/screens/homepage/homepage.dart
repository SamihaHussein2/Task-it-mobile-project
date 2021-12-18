import 'package:flutter/material.dart';
// import 'package:testing/navigation_drawer.dart';
import 'package:hexcolor/hexcolor.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: TaskItDrawer(),
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return RotatedBox(
              quarterTurns: 1,
              child: IconButton(
                icon: Icon(
                  Icons.bar_chart_rounded,
                  color: HexColor("#F2F2F4"),
                ),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            );
          },
        ),
        backgroundColor: HexColor("#1E4E5F"),
        // elevation: 0.0,
      ),
      body: Center(
        child: Text('Home Page'),
      ),
    );
  }
}

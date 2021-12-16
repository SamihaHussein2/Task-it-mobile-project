import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task_it/screens/homepage.dart';
import 'package:task_it/utils/custom_colors.dart';

void main() => runApp(TaskItApp());

class TaskItApp extends StatefulWidget {
  TaskItApp({Key? key}) : super(key: key);

  _TaskItAppState createState() => _TaskItAppState();
}

class _TaskItAppState extends State<TaskItApp> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, //top bar color
      ),
    );
    // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        canvasColor: CustomColors.GreyBackground,
        fontFamily: 'rubik',
      ),
      home: Homepage(),
    );
  }
}

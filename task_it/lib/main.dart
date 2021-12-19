import 'package:flutter/material.dart';
import '/screens/Intro/signup.dart';
import '/screens/Intro/welcome_page.dart';
import '/screens/user_account.dart';
import 'spalsh.dart';

import '/screens/lists_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //edit the first page will be splash and then --> WelcomeHomepage (1st time only)
    //Splash --> homepage (after signing in or skip)
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // title: 'Task it',
      // home: Splash(),
      title: 'Task it', home: Splash(),
    );
  }
}

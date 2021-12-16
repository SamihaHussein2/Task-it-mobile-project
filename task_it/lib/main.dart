import 'package:flutter/material.dart';
import 'package:task_it/screens/Intro/login.dart';
import 'package:task_it/screens/Intro/signup.dart';
import 'package:task_it/screens/user_account.dart';
import 'package:task_it/screens/Intro/welcome_page.dart';
import 'package:task_it/spalsh.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //edit the first page will be splash and then --> WelcomeHomepage (1st time only) or homepage
    return MaterialApp(title: 'Task it', home: Splash());
  }
}

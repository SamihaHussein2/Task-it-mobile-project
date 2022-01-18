import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'screens/homepage/homepage.dart';
import 'screens/Intro/signup.dart';
import 'screens/Intro/welcome_page.dart';
import 'screens/user_account.dart';
import 'spalsh.dart';
import 'screens/lists_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //edit the first page will be splash and then --> WelcomeHomepage (1st time only)
    //Splash --> homepage (after signing in or skip)
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task it',
      home: Splash(),
      // themeMode: ThemeMode.system,
      // home: TaskList(),
    );
  }
}

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_it/screens/Intro/login.dart';
import 'package:task_it/screens/navscreens/homepage/homepage.dart';
import 'package:task_it/screens/navscreens/main_page.dart';
import 'package:task_it/spalsh.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser?.uid;
    if (user != null) {
      return MainPage();
    }

    return Splash();
  }
}

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:task_it/view/Welcome_Page.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                Image.asset("assets/logo/logo-icon.png"),
                Image.asset(
                  "assets/logo/OUR-LOGO.png",
                  width: 70,
                  height: 70,
                ),
              ],
            )));
  }
}

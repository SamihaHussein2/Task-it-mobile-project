import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import '/screens/Intro/login.dart';

import '/constants/custom_colors.dart';

class Settings extends StatelessWidget {
  String appURL =
      "https://play.google.com/store/apps/details?id=com.miu.taskit";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: [
      const SizedBox(height: 70),
      ListTile(
        leading: Icon(Icons.login, color: CustomColors.Midnight),
        onTap: () {
          Navigator.push(
              context, new MaterialPageRoute(builder: (context) => Login()));
        },
        title: const Text("Login/Register"),
      ),
      ListTile(
        leading: Icon(Icons.share, color: CustomColors.Midnight),
        onTap: () {
          Share.share(appURL);
        },
        title: Text("Share App"),
      ),
    ]));
  }
}

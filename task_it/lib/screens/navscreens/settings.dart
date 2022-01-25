import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:launch_review/launch_review.dart';

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
          Share.share(appURL);
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
      ListTile(
        leading: Icon(Icons.star_border_outlined, color: CustomColors.Midnight),
        onTap: () {
          LaunchReview.launch(androidAppId: "com.miu.taskit");
        },
        title: Text("Rate App on PlayStore"),
      ),
    ]));
  }
}

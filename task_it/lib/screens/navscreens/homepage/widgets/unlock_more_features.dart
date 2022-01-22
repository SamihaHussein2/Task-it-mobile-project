import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_it/provider/Auth_service.dart';
import '/spalsh.dart';
import '/screens/Intro/login.dart';
import '/constants/custom_colors.dart';

class UnlockMoreFeatures extends StatelessWidget {
  const UnlockMoreFeatures({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.all(15),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: CustomColors.Midnight,
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Container(
                //   padding: EdgeInsets.all(8),
                //   // decoration: BoxDecoration(
                //   //   color: Colors.grey[800],
                //   //   shape: BoxShape.circle,
                //   // ),
                //   child:
                //       Icon(Icons.login, color: CustomColors.SeaShell, size: 20),
                // ),
                SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Login/Signup",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: CustomColors.Cultured),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Unlock more app features!",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: CustomColors.Cultured),
                    )
                  ],
                )
              ],
            ),
          ),
          Positioned(
            bottom: 35,
            right: 30,
            child: Container(
              decoration: BoxDecoration(
                  color: CustomColors.YellowOrange,
                  borderRadius: BorderRadius.circular(15)),
              child: IconButton(
                icon: Icon(Icons.login),
                color: CustomColors.SeaShell,
                onPressed: () {
                  final check = context.read<AuthenticationService>().signOut();

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login()));
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget _buildPopupDialog(BuildContext context, String text) {
  return new AlertDialog(
    title: const Text('Popup example'),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(text),
      ],
    ),
    actions: <Widget>[
      new FlatButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        textColor: Theme.of(context).primaryColor,
        child: const Text('Close'),
      ),
    ],
  );
}

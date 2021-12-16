// import 'package:flutter/material.dart';
// import '/screens/settings.dart';
// import '/screens/leaderboard.dart';

// class AppDrawer extends StatelessWidget {
//   AppDrawer(this.currentPage);
//   final String currentPage;

//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//         child: ListView(
//       children: <Widget>[
//         // ListTile(
//         //   title: Text("My Account"),
//         //   trailing: Icon(Icons.account_circle_outlined),
//         //   onTap:(){
//         //     Navigator.of(context).pop();
//         //     if(this.currentPage == "My Account") return;
//         //     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => MyAccount(title:"My Account")));
//         //   }
//         // ),
//         ListTile(
//             title: Text("Settings"),
//             trailing: Icon(Icons.settings),
//             onTap: () {
//               Navigator.of(context).pop();
//               if (this.currentPage == "Settings") return;
//               Navigator.of(context).pushReplacement(MaterialPageRoute(
//                   builder: (BuildContext context) =>
//                       Settings(title: "Settings")));
//             }),
//         ListTile(
//             title: Text("Leaderboard"),
//             trailing: Icon(Icons.leaderboard),
//             onTap: () {
//               Navigator.of(context).pop();
//               if (this.currentPage == "Leaderboard") return;
//               Navigator.of(context).pushReplacement(MaterialPageRoute(
//                   builder: (BuildContext context) =>
//                       Leaderboard(title: "Leaderboard")));
//             }),
//       ],
//     ));
//   }
// }

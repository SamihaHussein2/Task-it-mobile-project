import 'package:flutter/material.dart';
import 'package:task_it/components/custom_colors.dart';
import 'package:task_it/models/profile_icons.dart';
import 'package:task_it/screens/Intro/login.dart';
import 'package:task_it/screens/Intro/welcome_page.dart';
import 'package:task_it/screens/homepage/homepage.dart';
import 'package:task_it/spalsh.dart';

class account extends StatelessWidget {
  //const account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset:
            false, // to pervent bottom overflowed when the keyboard appears
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "Profile",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: CustomColors.Midnight),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          //systemOverlayStyle: SystemUiOverlayStyle.light, //badal brightness fl version el gedida
          leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => welcomepage()));
              //change location to homepage
            },
            icon: const Icon(Icons.arrow_back),
            iconSize: 20,
            color: CustomColors.Midnight,
          ),
        ),
        body: ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Column(
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundImage:
                                  AssetImage("assets/avatar/avatar.jpg"),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Container(
                                height: 25,
                                width: 30,
                                margin: EdgeInsets.only(left: 70),
                                decoration: BoxDecoration(
                                    color: CustomColors.Midnight,
                                    shape: BoxShape.circle),
                                child: Icon(
                                  Icons.edit,
                                  color: CustomColors.YellowOrange,
                                  size: 17,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Salma Tamer",
                    style: TextStyle(color: CustomColors.Midnight),
                  ),
                  /* SizedBox(
                    height: 5,
                  ), */
                  Text(
                    "Salma12@gmail.com",
                    style: TextStyle(
                        fontSize: 12, color: CustomColors.YellowOrange),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 30,
                    width: 130,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: CustomColors.Midnight,
                    ),
                    child: Center(
                        child: MaterialButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                //after validation goes to homepage
                                builder: (context) => Splash()));
                      },
                      child: Text(
                        "Edit Profile",
                        style: TextStyle(color: CustomColors.SeaShell),
                      ),
                    )),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Card(
                child: Column(
              children: [
                ListTile(
                  tileColor: CustomColors.YellowOrange,
                  leading: Icon(Icons.emoji_events),
                  title: Text("Trophies"),
                ),
                ListTile(
                  leading: Wrap(
                    spacing: 20,
                    children: [
                      Image.asset(
                        "assets/avatar/avatar.jpg",
                        width: 30,
                      ),
                      Image.asset(
                        "assets/avatar/avatar.jpg",
                        width: 30,
                      ),
                      Image.asset(
                        "assets/avatar/avatar.jpg",
                        width: 30,
                      ),
                      Image.asset(
                        "assets/avatar/avatar.jpg",
                        width: 30,
                      ),
                      Image.asset(
                        "assets/avatar/avatar.jpg",
                        width: 30,
                      ),
                      Image.asset(
                        "assets/avatar/avatar.jpg",
                        width: 30,
                      ),
                    ],
                  ),
                  trailing: Icon(Icons.more_vert),
                ),
              ],
            )),
            SizedBox(
              height: 20,
            ),
            Card(
              color: CustomColors.YellowOrange,
              child: ListTile(
                title: Text("Logout"),
                leading: Icon(Icons.logout),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          //change page to the homepage
                          builder: (context) => login()));
                },
              ),
            )
          ],
        ));
  }
}

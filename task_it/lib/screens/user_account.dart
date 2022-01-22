import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_it/screens/trophies.dart';
import '../provider/Auth_service.dart';
import '/constants/custom_colors.dart';
import 'package:image_picker/image_picker.dart';
import '/spalsh.dart';
import 'Intro/login.dart';
import 'navscreens/main_page.dart';

class Account extends StatelessWidget {
  //const account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //String? cureent = FirebaseAuth.instance.currentUser?.uid.toString();

    int currentIndex = 0;
    final Stream<QuerySnapshot> users =
        FirebaseFirestore.instance.collection('users').snapshots();
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
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MainPage()));
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
                  StreamBuilder<QuerySnapshot>(
                      stream: users,
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError) {
                          return Text('Something went wrong');
                        }
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Text('loading');
                        }
                        final data = snapshot.requireData;
                        return Column(
                          children: [
                            Text(
                              "${data.docs[currentIndex]['name']}",
                              style: TextStyle(color: CustomColors.Midnight),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "${data.docs[currentIndex]['email']}",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: CustomColors.YellowOrange),
                            ),
                          ],
                        );
                      }),
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
                        Navigator.pop(
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
                        "assets/trophies/trophy1.png",
                        width: 30,
                      ),
                      Image.asset(
                        "assets/trophies/trophy2.png",
                        width: 30,
                      ),
                      Image.asset(
                        "assets/trophies/trophy3.png",
                        width: 30,
                      ),
                      Image.asset(
                        "assets/trophies/grey_trophy.png",
                        width: 30,
                      ),
                    ],
                  ),
                  trailing: Icon(Icons.more_vert),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            //change page to the homepage
                            builder: (context) => TrophiesScreen()));
                  },
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
                  final check = context.read<AuthenticationService>().signOut();

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login()));
                },
              ),
            ),
            Card(
              color: CustomColors.YellowOrange,
              child: ListTile(
                title: Text("Delete Account"),
                leading: Icon(Icons.delete),
                onTap: () async {
                  final check = await context
                      .read<AuthenticationService>()
                      .deleteAccount();
                  print(check);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login()));
                },
              ),
            )
          ],
        ));
  }
}

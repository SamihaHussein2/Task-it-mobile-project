import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_it/provider/Firestore_services.dart';
import 'package:task_it/provider/Firestore_storage.dart';
import 'package:task_it/screens/trophies.dart';
import '../provider/Auth_service.dart';
import '/constants/custom_colors.dart';
import 'Intro/login.dart';
import 'navscreens/main_page.dart';

class Account extends StatefulWidget {
  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  //const account({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    final users = FirebaseFirestore.instance.collection('users');
    print(userID);
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
                            FutureBuilder<DocumentSnapshot>(
                              future: users.doc(userID).get(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                                if (snapshot.hasError) {
                                  return Text("Something went wrong");
                                }

                                if (snapshot.hasData &&
                                    !snapshot.data!.exists) {
                                  return Text("Document does not exist");
                                }

                                if (snapshot.connectionState ==
                                    ConnectionState.done) {
                                  Map<String, dynamic> data = snapshot.data!
                                      .data() as Map<String, dynamic>;
                                  return CircleAvatar(
                                    backgroundColor: CustomColors.Midnight,
                                    radius: 50,
                                    child: ClipOval(
                                        child: new SizedBox(
                                            width: 90.0,
                                            height: 90.0,
                                            child: Image.network(
                                              data['Photo URL'],
                                              fit: BoxFit.fill,
                                            ))),
                                  );
                                }
                                return Text("loading");
                              },
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
                                child: IconButton(
                                  icon: Icon(Icons.camera_alt_rounded),
                                  color: CustomColors.YellowOrange,
                                  iconSize: 14,
                                  onPressed: () {
                                    // final snackBarGallery = SnackBar(
                                    //   action: SnackBarAction(
                                    //     onPressed: () {
                                    //       uploadImgGallery();
                                    //     },
                                    //     label: '',
                                    //   ),
                                    //   content: Text('Upload from Gallery'),
                                    // );
                                    // final snackBarCamera = SnackBar(
                                    //   action: SnackBarAction(
                                    //     onPressed: () {
                                    //       uploadImg();
                                    //     },
                                    //     label: '',
                                    //   ),
                                    //   content: Text('Upload from Camera'),
                                    // );
                                    // ScaffoldMessenger.of(context)
                                    //     .showSnackBar(snackBarGallery);
                                    // ScaffoldMessenger.of(context)
                                    //     .showSnackBar(snackBarCamera);
                                    // print(FirebaseAuth
                                    //     .instance.currentUser?.email);
                                    //uploadImg();
                                    showModalBottomSheet(
                                      enableDrag: false,
                                      isDismissible: false,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(24),
                                          topRight: Radius.circular(24),
                                        ),
                                      ),
                                      context: context,
                                      builder: (context) => Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          ListTile(
                                            leading: Icon(Icons.camera),
                                            title: Text('Take Photo'),
                                            onTap: () {
                                              uploadImg();
                                            },
                                          ),
                                          ListTile(
                                            leading: Icon(
                                                Icons.photo_library_rounded),
                                            title:
                                                Text('Select From Camera Roll'),
                                            onTap: () => {uploadImgGallery()},
                                          ),
                                        ],
                                      ),
                                    );
                                  },
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
                  FutureBuilder<DocumentSnapshot>(
                    future: users.doc(userID).get(),
                    builder: (BuildContext context,
                        AsyncSnapshot<DocumentSnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return Text("Something went wrong");
                      }

                      if (snapshot.hasData && !snapshot.data!.exists) {
                        return Text("Document does not exist");
                      }

                      if (snapshot.connectionState == ConnectionState.done) {
                        Map<String, dynamic> data =
                            snapshot.data!.data() as Map<String, dynamic>;
                        return Column(
                          children: [
                            Text(
                              "${data['Full Name']}",
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 25,
                                  color: CustomColors.Midnight),
                            ),
                          ],
                        );
                      }
                      return Text("loading");
                    },
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
                        // Navigator.pop(
                        //     context,
                        //     MaterialPageRoute(
                        //         //after validation goes to homepage
                        //         builder: (context) => Splash()));
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
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
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
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
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
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              color: CustomColors.YellowOrange,
              child: ListTile(
                title: Text("Delete Account"),
                leading: Icon(Icons.delete),
                onTap: () async {
                  final check = await context
                      .read<AuthenticationService>()
                      .deleteAccount();
                  await DeleteUserFromFirestore();
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

void _show(BuildContext ctx) {
  mainBottomSheet(BuildContext context) {
    _camera() {
      uploadImg();
    }

    _gallery() {
      uploadImgGallery();
    }

    ListTile _createTile(
        BuildContext context, String name, IconData icon, Function action) {
      return ListTile(
        leading: Icon(icon),
        title: Text(name),
        onTap: () {
          //Navigator.pop(context);
          action();
        },
      );
    }

    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _createTile(context, 'Take Photo', Icons.message, _camera),
              _createTile(context, 'Select From Camera Roll', Icons.camera_alt,
                  _gallery),
            ],
          );
        });
  }
}

// Widget _buildPopupDialog(BuildContext context, String text) {
//   return new AlertDialog(
//     title: const Text('Edit Profile'),
//     content: new Column(
//       mainAxisSize: MainAxisSize.min,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[Text("Name:"), TextField()],
//     ),
//     actions: <Widget>[
//       new FlatButton(
//         onPressed: () {
//           Navigator.of(context).pop();
//         },
//         textColor: Theme.of(context).primaryColor,
//         child: const Text('Close'),
//       ),
//     ],
//   );
// }


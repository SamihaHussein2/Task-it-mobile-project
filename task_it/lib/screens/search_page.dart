// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '/screens/navscreens/main_page.dart';

class SearchPage extends SearchDelegate {
  final userID = FirebaseAuth.instance.currentUser?.uid;
  final CollectionReference _firebaseFirestore =
      FirebaseFirestore.instance.collection("users");

  @override
  List<Widget>? buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MainPage()));
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _firebaseFirestore.snapshots().asBroadcastStream(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.data!.docs
                .where((QueryDocumentSnapshot<Object?> element) =>
                    element['Full Name']
                        .toString()
                        .toLowerCase()
                        .contains(query.toLowerCase()))
                .isEmpty) {
              return Center(
                child: Text("No users found"),
              );
            } else {
              //Fetch Data
              return ListView(children: [
                ...snapshot.data!.docs
                    .where((QueryDocumentSnapshot<Object?> element) =>
                        element['Full Name']
                            .toString()
                            .toLowerCase()
                            .contains(query.toLowerCase()))
                    .map((QueryDocumentSnapshot<Object?> data) {
                  final String name = data.get('Full Name');
                  //final String image = data['Photo'];

                  return ListTile(
                      onTap: () {
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) => Account()));
                      },
                      title: Text(name),
                      // leading: CircleAvatar(
                      //   backgroundImage: NetworkImage(image),
                      // ),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.add,
                          color: Color(0xFF1E4E5F),
                        ),
                        iconSize: 30,
                        onPressed: () {},
                      ));
                })
              ]);
            }

            //print(snapshot.data);

          }
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(child: Text("Search for friends"));
  }
}

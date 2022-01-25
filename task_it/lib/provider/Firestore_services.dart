import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

CollectionReference users = FirebaseFirestore.instance.collection('users');

String? uid;

Future<String?> GetID(String? id) async {
  print(uid);
  return uid = id;
}

Future<void> setImg(String PhotoURL) async {
  print(uid);
  users.doc(uid).update({'Photo URL': PhotoURL});
  print("ID NOW:");
  print(uid);
  return;
}

Future<void> AddUserInFirestore(
    String displayName, String email, String img) async {
  var score = 0;
  users.doc(uid).set({
    'Full Name': displayName,
    'ID': uid,
    'email': email,
    'Photo URL': img,
    'Score': score
  });
  //users.doc(uid).add({'Full Name': displayName, 'ID': uid, 'email': email});
  return;
}

Future<void> DeleteUserFromFirestore() async {
  users.doc(uid).delete();
  return;
}

Future<void> UpdateUser(String displayName, String email) async {
  users.doc(uid).update({'Full Name': displayName, 'email': email});
  return;
}

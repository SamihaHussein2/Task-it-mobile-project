import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

CollectionReference users = FirebaseFirestore.instance.collection('users');
String? uid;

Future<String?> GetID(String? id) async {
  return uid = id;
}

Future<void> AddUserInFirestore(String displayName, String email) async {
  users.doc(uid).set({'Full Name': displayName, 'ID': uid, 'email': email});
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

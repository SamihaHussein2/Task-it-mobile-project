import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireStoreServices {
  String uid = FirebaseAuth.instance.currentUser!.uid;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
}

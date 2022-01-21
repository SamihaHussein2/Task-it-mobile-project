import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProviderUser extends ChangeNotifier {
  String? _uid;
  String? _email;

  String? get getUserid => _uid;
  String? get getUserEmail => _email;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> signUpUser(String email, String password) async {
    bool returnVal = false;

    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: email,
          password:
              password); //AuthResult --> UserCredential (new version flutter)
      if (userCredential.user != null) {
        _uid = userCredential.user?.uid;
        _email = userCredential.user?.email;
        return returnVal = true;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }

    return returnVal;
  }

  Future<bool> loginUser(String email, String password) async {
    bool returnVal = false;

    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email,
          password:
              password); //AuthResult --> UserCredential (new version flutter)

      if (userCredential.user != null) {
        _uid = userCredential.user?.uid;
        _email = userCredential.user?.email;
        returnVal = true;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    } catch (e) {
      print(e);
    }

    return returnVal;
  }
}

import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;

  AuthenticationService(this._firebaseAuth);

  Stream<User?> get authStateChanges => _firebaseAuth.idTokenChanges();

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<String?> signIn(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return "Signed in";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        return e.message;
      } else if (e.code == 'wrong-password') {
        print(e.message);
        return e.message;
      } else {
        print(e.message);
        return e.message;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<String?> deleteAccount() async {
    try {
      await FirebaseAuth.instance.currentUser!.delete();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        print(
            'The user must reauthenticate before this operation can be executed.');
      } else {
        return e.message;
      }
    }
  }

  Future<String?> signUp(String email, String password) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return 'Signed Up';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print(e.message);
        return e.message;
      } else if (e.code == 'email-already-in-use') {
        print(e.message);
        return e.message;
      } else {
        print(e.message);
        return e.message;
      }
    } catch (e) {
      print(e);
    }
  }
}

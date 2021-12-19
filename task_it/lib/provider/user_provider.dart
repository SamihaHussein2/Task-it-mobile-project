import 'package:flutter/material.dart';
import 'package:task_it/models/user.dart';

class UsersProvider extends ChangeNotifier {
  //Notes List
  List<user> _users = <user>[];

  List<user> get getUser {
    return _users;
  }

  // function to add data to list of notes
  void addUsers(int id, String email, String firstName, String lastName,
      String username, int? password) {
    user us = new user(id, email, firstName, lastName, username, password);
    _users.add(us);
    id++;
    notifyListeners();
  }

  void removeUser(int id) {
    _users.removeAt(id);
    id--;
    notifyListeners();
  }

  /* void editUser(int id) {
    
  } */
}

import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:task_it/models/default_tasks_model.dart';
import 'package:task_it/models/task.dart';


class ListProvider extends ChangeNotifier {
  final List<DefaultTasksList> lists = [];


   addList(DefaultTasksList list) {
    lists.add(list);
    notifyListeners();
  }


  void deleteList(DefaultTasksList list) {
    lists.remove(list);
    notifyListeners();
  }
}

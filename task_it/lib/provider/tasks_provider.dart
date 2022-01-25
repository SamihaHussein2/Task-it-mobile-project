import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:task_it/models/task.dart';

class TasksProvider with ChangeNotifier {
  //List of note
  final List<Task> _tasks = [];

  UnmodifiableListView<Task> get getTasks => UnmodifiableListView(_tasks);

  void createTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void toggleTask(Task task) {
    task.toggleComplete();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}

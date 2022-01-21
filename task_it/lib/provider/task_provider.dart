import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:task_it/models/default_tasks_model.dart';
import 'package:task_it/models/task.dart';


class TaskProvider extends ChangeNotifier {
  final List<Task> tasks = [];

  // List<Task> get allTasks => UnmodifiableListView(_tasks);
  // List<Task> get incompleteTasks => UnmodifiableListView(_tasks.where((todo) => !todo.completed));
  // List<Task> get completedTasks => UnmodifiableListView(_tasks.where((todo) => todo.completed));



  void addTask(Task task) {
    tasks.add(task);
    notifyListeners();
  }

  void toggleTask(Task task) {
    final taskIndex = tasks.indexOf(task);
    tasks[taskIndex].toggle();
    notifyListeners();
  }

  void deleteTask(Task task) {
    tasks.remove(task);
    notifyListeners();
  }
}

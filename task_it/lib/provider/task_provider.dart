import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:task_it/models/task.dart';


class TaskProvider extends ChangeNotifier {
  final List<Task> _tasks = [];

  List<Task> get allTasks => UnmodifiableListView(_tasks);
  List<Task> get incompleteTasks => UnmodifiableListView(_tasks.where((todo) => !todo.completed));
  List<Task> get completedTasks => UnmodifiableListView(_tasks.where((todo) => todo.completed));

  void addTodo(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void toggleTodo(Task task) {
    final taskIndex = _tasks.indexOf(task);
    _tasks[taskIndex].toggleCompleted();
    notifyListeners();
  }

  void deleteTodo(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}

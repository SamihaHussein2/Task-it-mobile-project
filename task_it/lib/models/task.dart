import 'package:flutter/material.dart';

import 'default_tasks_model.dart';

class Task {
  String title;
  DateTime? dateTime;
//  DefaultTasksList list;
  bool completed;

  Task({@required this.title='', this.dateTime, this.completed = false});

  void toggleCompleted() {
    completed = !completed;
  }
}
  
import 'package:flutter/material.dart';
// import 'package:task_it/constants/custom_colors.dart';

class Task {
  
  String id;
  String title;
  DateTime? dateTime;
  bool completed;

  Task({
    required this.id,
    required this.title,
    this.dateTime,
    this.completed = false,
  });

    void toggle() {
	completed = !completed;
}
}
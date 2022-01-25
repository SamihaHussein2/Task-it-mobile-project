import 'package:flutter/material.dart';
// import 'package:task_it/constants/custom_colors.dart';

class Task {
  String title;
  late String description;
  bool completed;

  Task({required this.title, this.completed = false});

  void toggleComplete() {
    completed = !completed;
  }
  // static Task fromJson(Map<String,dynamic> json) => Task (
  //   'title' : json['title'],
  //   'description': json['description']
  // );

  // Map<String,dynamic> toJson() => {
  //   'title' : title,
  //   'description': description,
  // };
}

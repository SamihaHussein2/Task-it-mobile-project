import 'package:flutter/material.dart';
// import 'package:task_it/constants/custom_colors.dart';

class Task {
  String title;
  String description;

  Task( this.title, this.description);

  // static Task fromJson(Map<String,dynamic> json) => Task (
  //   'title' : json['title'],
  //   'description': json['description']
  // );

  Map<String,dynamic> toJson() => {
    'title' : title,
    'description': description,
  };
}
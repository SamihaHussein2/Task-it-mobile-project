import 'package:flutter/material.dart';

class Task {
  int id;
  String title;
  String description;
  DateTime dateToRemind;
  TimeOfDay timeToRemind;
  Task(this.id, this.title,this.description, this.dateToRemind, this.timeToRemind);
}
  
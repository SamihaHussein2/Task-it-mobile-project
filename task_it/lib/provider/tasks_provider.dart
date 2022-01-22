import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:task_it/models/task.dart';

class TasksProvider extends ChangeNotifier {
  //List of note
  List<Note> _notes = [];

  List<Note> get getNotes {
    return _notes;
  }

  TasksProvider() {
    addNewNote('First Note', 'First Note Description');
    addNewNote('second Note', 'Description 2');
  }

  void addNewNote(String title, String description) {
    //Note object
    Note note = Note(title, description);
    _notes.add(note);
    notifyListeners();
  }
}
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_it/constants/custom_colors.dart';
import 'package:task_it/models/task.dart';
import 'package:task_it/provider/tasks_provider.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    late String title = '';
    late String description = '';
    return Scaffold(
      // appBar: AppBar(title: Text("add")),

      body: Container(
        padding: EdgeInsets.all(18),
        child: Column(
          children: [
            SizedBox(
              height: 80,
            ),
            SizedBox(
              // height: 80,
              child: Text("Add a new task",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              onChanged: (c) => title = c,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 30),
                hintText: 'Task Title...',
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
              ),
            ),

            SizedBox(
              height: 50,
            ),

            // add button
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: CustomColors.Midnight),
              child: Text(
                'Create Task',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: CustomColors.Cultured),
              ),

              // assign action
              onPressed: () {
                Provider.of<TasksProvider>(context, listen: false)
                    .createTask(Task(title: title));
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}

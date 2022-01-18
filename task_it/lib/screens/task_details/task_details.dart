import 'dart:html';

import 'package:flutter/material.dart';
import 'package:task_it/models/default_tasks_model.dart';

class TaskDetailPage extends StatelessWidget {
 final DefaultTasksList task;
 TaskDetailPage(this.task);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers:[
          _buildAppBar(context),
        ]
      )
      
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 90,
      backgroundColor: Colors.white,
      leading: IconButton(onPressed: ()=> Navigator.of(context).pop(), icon: Icon(Icons.arrow_back_ios), iconSize: 20,),
      actions: [
        Icon(Icons.more_vert, size: 40),
      ],
      flexibleSpace: FlexibleSpaceBar(
        title: Column(
          children: [
            Text('${task.taskTitle} tasks'),
          ]
        ),
      ),
    );
  }
}
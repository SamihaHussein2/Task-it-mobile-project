import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:task_it/screens/task_details/task_details.dart';
import '/constants/custom_colors.dart';
import '/models/default_tasks_model.dart';

class DefaultTasks extends StatelessWidget {
  final tasksList = DefaultTasksList.generateTasks();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: GridView.builder(
        itemCount: tasksList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
        itemBuilder: (context, index) => tasksList[index].isAddNewTask!
            ? _buildAddNewTask()
            : _buildTask(context, tasksList[index]),
      ),
    );
  }

  Widget _buildAddNewTask() {
    return DottedBorder(
        borderType: BorderType.RRect,
        radius: Radius.circular(20),
        dashPattern: [10, 10],
        color: Colors.grey,
        strokeWidth: 2,
        child: Center(
          child: Text('+ Add',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ));
  }

  Widget _buildTask(BuildContext context, DefaultTasksList task) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => TaskDetailPage(task))
        );
      },
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: task.backgroundColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(task.taskIcon, color: task.iconColor, size: 35),
            SizedBox(height: 30),
            Text(task.taskTitle!,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            Row(
              children: [
                _buildTaskStatus(task.buttonColor!, CustomColors.Midnight,
                    '${task.numberOfUnfinishedTasks} Left'),
                SizedBox(width: 5),
                _buildTaskStatus(CustomColors.YellowOrange, CustomColors.Midnight,
                    '${task.numberOfCompletedTasks} Done')
              ],
            )
          ],
        ),
      ),
    );
  }

// Completed or Unfinished
  Widget _buildTaskStatus(Color backgroundColor, Color textColor, String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
          color: backgroundColor, borderRadius: BorderRadius.circular(20)),
      child: Text(
        text,
        style: TextStyle(color: textColor),
      ),
    );
  }
}

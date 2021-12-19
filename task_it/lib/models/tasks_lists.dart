import 'package:flutter/material.dart';
import '/components/custom_colors.dart';

class TasksList {
  IconData? taskIcon;
  String? taskTitle;
  Color? backgroundColor;
  Color? iconColor;
  int? numberOfTasks;

  TasksList(
      {this.taskIcon,
      this.taskTitle,
      this.backgroundColor,
      this.iconColor,
      this.numberOfTasks,
       } ); //End of constructor

  static List<TasksList> generateTasks() {
    return [
      TasksList(
        taskIcon: Icons.person_rounded,
        taskTitle: 'Personal',
        backgroundColor: Color(0x92C9DD),
        iconColor: CustomColors.Cultured,
      ),
      TasksList(
        taskIcon: Icons.school_rounded,
        taskTitle: 'University',
        backgroundColor: Color(0xFFCF99),
        iconColor: CustomColors.Cultured,
      ),
      TasksList(
        taskIcon: Icons.shopping_basket_outlined,
        taskTitle: 'Groceries',
        backgroundColor: Color(0xEF8354),
        iconColor: CustomColors.Cultured,
      ),
    ];
  }
}

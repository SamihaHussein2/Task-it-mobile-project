import 'package:flutter/material.dart';
//import 'package:hexcolor/hexcolor.dart';
import '/constants/custom_colors.dart';

class DefaultTasksList {
  IconData? taskIcon;
  String? taskTitle;
  Color? backgroundColor;
  Color? iconColor;
  Color? buttonColor;
  num? numberOfUnfinishedTasks;
  num? numberOfCompletedTasks;
  bool? isAddNewTask;

  DefaultTasksList(
      {this.taskIcon,
      this.taskTitle,
      this.backgroundColor,
      this.iconColor,
      this.buttonColor,
      this.numberOfUnfinishedTasks,
      this.numberOfCompletedTasks,
      this.isAddNewTask = false}); //End of constructor

  static List<DefaultTasksList> generateTasks() {
    return [
      DefaultTasksList(
        taskIcon: Icons.person_rounded,
        taskTitle: 'Personal',
        backgroundColor: Color(0xFF92C9DD),
        iconColor: CustomColors.Cultured,
        buttonColor: CustomColors.Cultured,
        numberOfUnfinishedTasks: 2,
        numberOfCompletedTasks: 3,
      ),
      DefaultTasksList(
        taskIcon: Icons.school_rounded,
        taskTitle: 'University',
        backgroundColor: Color(0xFFFFCF99),
        iconColor: CustomColors.Cultured,
        buttonColor: CustomColors.Cultured,
        numberOfUnfinishedTasks: 2,
        numberOfCompletedTasks: 3,
      ),
      DefaultTasksList(
        taskIcon: Icons.shopping_basket_outlined,
        taskTitle: 'Groceries',
        backgroundColor: Color(0xFFEF8354),
        iconColor: CustomColors.Cultured,
        buttonColor: CustomColors.Cultured,
        numberOfUnfinishedTasks: 2,
        numberOfCompletedTasks: 3,
      ),
      DefaultTasksList(isAddNewTask: true),
    ];
  }
}

// import 'package:flutter/material.dart';
// //import 'package:hexcolor/hexcolor.dart';
// import '/components/custom_colors.dart';

// class DefaultTasksList {
//   IconData? taskIcon;
//   String? taskTitle;
//   Color? backgroundColor;
//   Color? iconColor;
//   Color? buttonColor;
//   num? numberOfUnfinishedTasks;
//   num? numberOfCompletedTasks;
//   bool? isAddNewTask;

//   DefaultTasksList(
//       {this.taskIcon,
//       this.taskTitle,
//       this.backgroundColor,
//       this.iconColor,
//       this.buttonColor,
//       this.numberOfUnfinishedTasks,
//       this.numberOfCompletedTasks,
//       this.isAddNewTask = false}); //End of constructor

//   static List<DefaultTasksList> generateTasks() {
//     return [
//       DefaultTasksList(
//         taskIcon: Icons.person_rounded,
//         taskTitle: 'Personal',
//         backgroundColor: HexColor("#92C9DD"),
//         iconColor: CustomColors.Cultured,
//         buttonColor: CustomColors.Cultured,
//         numberOfUnfinishedTasks: 2,
//         numberOfCompletedTasks: 3,
//       ),
//       DefaultTasksList(
//         taskIcon: Icons.school_rounded,
//         taskTitle: 'University',
//         backgroundColor: HexColor("#FFCF99"),
//         iconColor: CustomColors.Cultured,
//         buttonColor: CustomColors.Cultured,
//         numberOfUnfinishedTasks: 2,
//         numberOfCompletedTasks: 3,
//       ),
//       DefaultTasksList(
//         taskIcon: Icons.shopping_basket_outlined,
//         taskTitle: 'Groceries',
//         backgroundColor: HexColor("#EF8354"),
//         iconColor: CustomColors.Cultured,
//         buttonColor: CustomColors.Cultured,
//         numberOfUnfinishedTasks: 2,
//         numberOfCompletedTasks: 3,
//       ),
//       DefaultTasksList(isAddNewTask: true),
//     ];
//   }
// }

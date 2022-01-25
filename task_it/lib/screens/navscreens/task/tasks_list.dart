import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:task_it/constants/custom_colors.dart';
import 'package:task_it/models/task.dart';
import 'package:task_it/provider/tasks_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_it/screens/lists_page.dart';
import 'package:task_it/screens/navscreens/homepage/checkbox.dart';
import 'package:task_it/screens/navscreens/task/add_task.dart';

import '../../add_new_task.dart';

class TaskListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TasksProvider>(
      builder: (context, data, child) {
        return Scaffold(
          // appBar: AppBar(),
          body: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: data.getTasks.length,
            itemBuilder: (context, index) {
              final task = data.getTasks[index];
              return GestureDetector(
                  onLongPress: () => data.deleteTask(task),
                  child: Container(
                      margin: EdgeInsets.only(bottom: 10),
                      padding: EdgeInsets.fromLTRB(12, 5, 8, 5),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            task.title,
                            style: TextStyle(
                              decoration: task.completed
                                  ? TextDecoration.lineThrough
                                  : null,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Checkbox(
                            value: task.completed,
                            onChanged: (c) => data.toggleTask(task),
                            activeColor: CustomColors.Midnight,
                          ),
                        ],
                      )));
            },
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(
              Icons.add,
              color: CustomColors.Cultured,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddTaskScreen()));
            },
            backgroundColor: CustomColors.Midnight,
          ),
        );
      },
    );
  }
}
// class TasksListScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider<TasksProvider>(
//       create: (context) => TasksProvider(),
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: TasksList(),
//       ),
//     );
//   }
// }

// class TasksList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     String text = '';
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Add Task'),
//       ),
//       body: Container(
//         padding: EdgeInsets.all(18),
//         child: Column(
//           children: [
//             TextField(
//               onChanged: (c) => text = c,
//               decoration: InputDecoration(
//                 contentPadding: EdgeInsets.symmetric(horizontal: 10),
//                 hintText: 'Enter Task',
//                 border: const OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(8.0)),
//                 ),
//               ),
//             ),

//             // add button
//             FloatingActionButton(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.all(
//                   Radius.circular(8),
//                 ),
//               ),
//               child: Text(
//                 'Create Task',
//                 style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 10,
//                     color: Colors.black),
//               ),

//               // assign action
//               onPressed: () {
//                 Provider.of<TasksProvider>(context, listen: false)
//                     .createTask(Task(title: text));
//                 Navigator.pop(context);
//               },
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
//     return Scaffold(
//       backgroundColor: CustomColors.Cultured,
//       body: Consumer<TasksProvider>(
//         builder: (context, TasksProvider data, child) {
//           return data.getTasks.isNotEmpty
//               ? ListView.builder(
//                   itemCount: data.getTasks.length,
//                   itemBuilder: (context, index) {
//                     return CardList(data.getTasks[index], index);
//                   },
//                 )
//               : GestureDetector(
//                   onTap: () {
//                     showAlertDialog(context);
//                   },
//                   child: const Center(
//                       child: Text(
//                     "Start Tasking!",
//                     style: TextStyle(
//                       color: Colors.black,
//                     ),
//                   )));
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           showAlertDialog(context);
//         },
//         backgroundColor: CustomColors.Midnight,
//         child: const Icon(Icons.add, color: CustomColors.Cultured),
//       ),
//     );
//   }
// }

// // ignore: must_be_immutable
// class CardList extends StatelessWidget {
//   final Task tasks;
//   int index;
//   // ignore: use_key_in_widget_constructors
//   CardList(this.tasks, this.index);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(2.0),
//       child: ListTile(
//         leading: const Icon(Icons.note),
//         title: Text(tasks.title),
//         subtitle: Text(tasks.description),
//         trailing:
//             const Icon(Icons.arrow_forward_ios, color: CustomColors.Midnight),
//       ),
//     );
//   }
// }

// showAlertDialog(BuildContext context) {
//   TextEditingController _title = TextEditingController();
//   TextEditingController _description = TextEditingController();

//   Widget createButton = TextButton(
//     child: const Text("Create Task"),
//     onPressed: () {
//       Provider.of<TasksProvider>(context, listen: false)
//           .createTask(_title.text, _description.text);
//       Navigator.of(context).pop();
//     },
//   );

//   AlertDialog alertDialog = AlertDialog(
//     title: const Text("Add a new task"),
//     content: Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         TextField(
//           controller: _title,
//           decoration: const InputDecoration(hintText: "Enter Title"),
//         ),
//         TextField(
//           controller: _description,
//           decoration: const InputDecoration(hintText: "Enter Description"),
//         ),
//       ],
//     ),
//     actions: [
//       createButton,
//     ],
//   );

//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return alertDialog;
//     },
//   );
// }

// class NotesCard extends StatelessWidget {
//   final Task note;

//   NotesCard(this.note);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.all(15),
//       padding: EdgeInsets.all(15),
//       height: 150,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(15),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             note.title,
//             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//           ),
//           SizedBox(height: 5),
//           Text(
//             note.description,
//             style: TextStyle(fontSize: 17),
//           ),
//           CheckBox(),
//         ],
//       ),
//     );
//   }
// }
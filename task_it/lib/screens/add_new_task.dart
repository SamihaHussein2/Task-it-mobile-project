import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:task_it/models/task.dart';
import 'package:task_it/provider/tasks_provider.dart';
import '/constants/custom_colors.dart';
class AddTaskForm extends StatefulWidget {
  @override
  State<AddTaskForm> createState() => _AddTaskFormState();
}

class _AddTaskFormState extends State<AddTaskForm> {
  bool isTaskTitleFilled = false;
  bool isTaskDescFilled = false;

  late TextEditingController titleController;
  late TextEditingController descController;
  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
    descController = TextEditingController();
    titleController.addListener(() {
      final isTaskTitleFilled = titleController.text.isNotEmpty;
      setState(() => this.isTaskTitleFilled = isTaskTitleFilled);
    });
    descController.addListener(() {
      final isTaskTitleFilled = descController.text.isNotEmpty;
      setState(() => this.isTaskDescFilled = isTaskDescFilled);
    });
  }

  @override
  void dispose() {
    titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    String titleText = '';
    String descriptionText = '';
    return Form(
      key: _formKey,
      child: ListView(
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20.0),
          Center(
            child: Column(
              children: [
                Text("Add New Task!",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22 ),),
                const SizedBox(height: 20.0),
                Container(
                  width: 250,
                  child: TextFormField(
                    onChanged: (c) => titleText = c,
                    controller: titleController,
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 16.0),
                      labelText: 'title',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      isDense: true,
                    ),
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty) {
                        return 'no title';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 20.0),
               Container(
                  width: 350,
                  child: TextFormField(
                    onChanged: (c) => descriptionText = c,
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 16.0),
                      labelText: 'desc',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      isDense: true,
                    ),
                    // validator: (value) {
                    //   if (value == null ||
                    //       value.isEmpty) {
                    //     return 'no desc';
                    //   }
                    //   return null;
                    // },
                  ),
                ),
                const SizedBox(height: 20.0),
                // Container(
                //     width: 250,
                //     child: InputDatePickerFormField(
                //       firstDate: DateTime.now(),
                //       lastDate: DateTime(2050, 1, 1),
                //       initialDate: DateTime.now(),
                // //     )),
                // const SizedBox(height: 20.0),
                // Container(
                //     // width: 250,
                //     // height: 200,
                //     child: TimePickerDialog(
                //   initialTime: TimeOfDay.now(),
                // )),
                // const SizedBox(height: 20.0),
                Container(
                  width: 250,
                  //height: 200,
                  child: DropdownButtonFormField(
                    items: ['Personal', 'University', 'Work']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(0, 5.5, 0, 0),
                        labelStyle: TextStyle(),
                        labelText: 'add to list'),
                    onChanged: (String? value) {},
                    // onChanged: (value) {
                    //   setState(() {
                    //     task.priority = value;
                    //   });
                    // },
                  ),
                ),
                const SizedBox(height: 20.0),
                Container(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: isTaskTitleFilled
                        ? () {
                            if (_formKey.currentState!.validate()) {
                              // you'd often call a server or save the information in a database.
                              // Provider.of<TaskProvider>(context).addTask(Task(
                              //   id: '1',
                              //   title: title,
                              //   dateTime: dateTime,
                              // ));
                             builder: (context)=>  Provider.of<TasksProvider>(context, listen: false).addNewNote(titleText, descriptionText);
                            }
                          }
                        : null,
                    child: const Text('Create Tasky'),
                  ),
                ),
                const SizedBox(height: 20.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

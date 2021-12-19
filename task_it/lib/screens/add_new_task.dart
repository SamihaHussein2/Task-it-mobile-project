import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '/components/custom_colors.dart';

class AddTaskForm extends StatefulWidget {
  @override
  State<AddTaskForm> createState() => _AddTaskFormState();
}

class _AddTaskFormState extends State<AddTaskForm> {
  bool isTaskTitleFilled = false;

  late TextEditingController titleController;
  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
    titleController.addListener(() {
      final isTaskTitleFilled = titleController.text.isNotEmpty;
      setState(() => this.isTaskTitleFilled = isTaskTitleFilled);
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

    return Form(
      key: _formKey,
      child: ListView(
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20.0),
          Center(
            child: Column(
              children: [
                Container(
                  width: 250,
                  child: TextFormField(
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
                          value.isEmpty ||
                          value.length > 100) {
                        return 'not accepted title';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 20.0),
                Container(
                  width: 250,
                  child: TextFormField(
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 24.0),
                      labelText: 'desc',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      isDense: true,
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                Container(
                    width: 250,
                    child: InputDatePickerFormField(
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2050, 1, 1),
                      initialDate: DateTime.now(),
                    )),
                const SizedBox(height: 20.0),
                Container(
                    // width: 250,
                    // height: 200,
                    child: TimePickerDialog(
                  initialTime: TimeOfDay.now(),
                )),
                const SizedBox(height: 20.0),
                Container(
                  width: 250,
                  //height: 200,
                  child: DropdownButtonFormField(
                    items: ['low', 'meduim', 'high']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(0, 5.5, 0, 0),
                        labelStyle: TextStyle(),
                        labelText: 'priority'),
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

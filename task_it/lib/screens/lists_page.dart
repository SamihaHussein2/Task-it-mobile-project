import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '/components/custom_colors.dart';

// void main() {
//   runApp(const List());
// }

class TaskList extends StatelessWidget {
  const TaskList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: AllLists(),
    ));
  }
}

// ignore: use_key_in_widget_constructors
class AllLists extends StatelessWidget {
  void _show(BuildContext ctx) {
    showMaterialModalBottomSheet(
        // add button add w add task fi al set state?
        elevation: 10,
        backgroundColor: Colors.amber,
        context: ctx,
        builder: (ctx) => Container(
              //width: 100,
              height: 500,
              color: Colors.white,
              alignment: Alignment.center,
              child: _addTaskForm(),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("aa"),
      ),
      body: _vieweAllLists(),
      floatingActionButton: ElevatedButton(
        child: const Text('add new task'),
        onPressed: () => _show(context),
      ),
    );
  }
}

Widget _vieweAllLists() {
  void _listOptions(BuildContext ctx) {
    showMaterialModalBottomSheet(
        // add button add w add task fi al set state?
        elevation: 10,
        backgroundColor: CustomColors.Midnight,
        context: ctx,
        builder: (ctx) => Container(
            //width: 100,
            height: 200,
            //color: CustomColors.SeaShell,
            alignment: Alignment.center,
            child: Column(
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(CustomColors.Cultured),
                  ),
                  onPressed: () {},
                  child: Text(
                    "4225",
                    style: TextStyle(color: CustomColors.Midnight),
                  ),
                )
              ],
            )));
  }

  final icons = [
    Icons.face,
    Icons.info,
    Icons.call,
    Icons.home,
    Icons.local_grocery_store_rounded
  ];
  final colors = [
    Colors.pink,
    Colors.green,
    Colors.blue,
    Colors.red,
    Colors.orange
  ];
  Map<String, int> lists = {
    'list1': 5,
    'list2': 2,
    'list3': 1,
    'list4': 9,
    'list5': 4
  };

  return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300,
          childAspectRatio: 1,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
      itemCount: lists.length,
      itemBuilder: (BuildContext context, index) {
        return Card(
          color: CustomColors.SeaShell,
          margin: const EdgeInsets.only(
              left: 10.0, right: 5.0, top: 10.0, bottom: 10.0),
          elevation: 10.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          child: InkWell(
            onTap: () {
              print('tapped');
            },
            onLongPress: () {
              _listOptions(context);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icons[index], size: 40.0, color: colors[index]),
                //Image(image: AssetImage(images[index]), alignment: Alignment.center, width: 50 ,height: 50, ),
                Text(
                  lists.keys.elementAt(index),
                  style: const TextStyle(
                      color: CustomColors.Midnight,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                Text(
                  lists.values.elementAt(index).toString() + " task",
                  style: const TextStyle(
                      color: CustomColors.Midnight,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      });
}

Widget _addTaskForm() {
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
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 16.0),
                    hintText: 'title',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    isDense: true,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length > 100) {
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
                    contentPadding: const EdgeInsets.symmetric(vertical: 24.0),
                    hintText: 'desc',
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
                  onPressed: () {
                    // Validate returns true if the form is valid, or false otherwise.
                    if (_formKey.currentState!.validate()) {
                      // you'd often call a server or save the information in a database.
                    }
                  },
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

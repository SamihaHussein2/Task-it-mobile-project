import 'package:flutter/material.dart';

class CheckBox extends StatefulWidget {

  @override
  _CheckBoxState createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: isChecked,
      onChanged: (bool? value) { // This is where we update the state when the checkbox is tapped
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '/screens/lists_page.dart';
import '/screens/user_account.dart';
import '/constants/custom_colors.dart';
import '/screens/navscreens/homepage/widgets/default_tasks.dart';
import '/screens/navscreens/homepage/widgets/unlock_more_features.dart';
import '/screens/add_new_task.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.Cultured,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UnlockMoreFeatures(),
          Container(
            padding: EdgeInsets.all(15),
            child: Text('Tasks',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          ),
          Expanded(
            child: DefaultTasks(),
          )
        ],
      ),
    );
  }
}

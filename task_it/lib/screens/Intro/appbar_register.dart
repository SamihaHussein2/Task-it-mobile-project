import 'package:flutter/material.dart';
import 'package:task_it/screens/Intro/welcome_page.dart';

class register_appbar extends StatelessWidget implements PreferredSizeWidget {
  //final Text title;
  final AppBar appBar;
  final String title;
  const register_appbar({Key? key, required this.appBar, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.bold, color: const Color(0xffee3f23)),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        //systemOverlayStyle: SystemUiOverlayStyle.light, //badal brightness fl version el gedida
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => welcomepage()));
          },
          icon: const Icon(Icons.arrow_back),
          iconSize: 20,
          color: Color(0xffee3f23),
        ));
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}

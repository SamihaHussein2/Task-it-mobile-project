import 'package:flutter/material.dart';
import 'package:task_it/models/profile_icons.dart';
import 'package:task_it/screens/Intro/welcome_page.dart';

class account extends StatelessWidget {
  //const account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset:
            false, // to pervent bottom overflowed when the keyboard appears
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "Profile",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Color(0xffee3f23)),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          //systemOverlayStyle: SystemUiOverlayStyle.light, //badal brightness fl version el gedida
          leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => welcomepage()));
              //change location to homepage
            },
            icon: const Icon(Icons.arrow_back),
            iconSize: 20,
            color: Color(0xffee3f23),
          ),
        ),
        body: ListView.builder(
          itemCount: options.length + 2,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return SizedBox(height: 15.0);
            } else if (index == options.length + 1) {
              return SizedBox(height: 100.0);
            }
            return Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(10.0),
              width: double.infinity,
              height: 70.0,
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: Color(0xffee3f23))),
              child: ListTile(
                hoverColor: Colors.amber,
                leading: options[index - 1].icon,
                title: Text(
                  options[index - 1].title,
                  style: TextStyle(
                    color: const Color(0xffee3f23),
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => options[index - 1].location));
                },
              ),
            );
          },
        ));
  }
}

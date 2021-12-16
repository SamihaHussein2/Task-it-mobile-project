import 'package:flutter/material.dart';
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
    );
  }
}

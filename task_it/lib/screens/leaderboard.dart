

import 'package:flutter/material.dart';

class LeaderBoardScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      // ignore: prefer_const_constructors
      decoration: BoxDecoration(
        color: Colors.amber,
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation:0.0,
          leading: Icon(Icons.arrow_back_ios, color: Colors.white,),
          actions: [Icon(Icons.grid_view, color: Colors.white,),],
        ),
      ),
    );
  }


}


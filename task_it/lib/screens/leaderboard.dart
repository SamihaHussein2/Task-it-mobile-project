
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class LeaderBoardScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      // ignore: prefer_const_constructors
      decoration: BoxDecoration(
      color: Colors.teal[300],
      ),
      child: Scaffold(
         backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation:0.0,
          leading: Icon(Icons.arrow_back_ios, color: Colors.white,),
          title: Text("Leaderboard"),
          centerTitle: true,
          actions: [Icon(Icons.grid_view, color: Colors.white,),],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Classify(), Classify(), Classify()
            ],
          ),
          
        )
      ),
    );
  }
}

class Classify extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.0,
      width:70.0,
      decoration: BoxDecoration(
        color: Colors.teal[100],
        borderRadius: BorderRadius.circular(15.0),
      )
    );
  }
  
}




// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class LeaderBoardScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      // ignore: prefer_const_constructors
      decoration: BoxDecoration(
        color: Colors.teal[200],
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation:0.0,
          leading: Icon(Icons.arrow_back_ios, color: Colors.white,),
          actions: [Icon(Icons.grid_view, color: Colors.white,),],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.8),
          child: Column(
            children: [
              Container(
                height:50.0,
                decoration:BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.teal[100],
                ),
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Year', style:TextStyle(color: Colors.white,),),
                    Text('Week', style:TextStyle(color: Colors.white,),),
                    Text('Month', style:TextStyle(color: Colors.white,),),
                  ],
                )
              )
            ],
          )
        )
      ),
    );
  }


}


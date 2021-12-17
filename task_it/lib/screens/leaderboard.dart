
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables


import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class LeaderBoardScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
      color: Colors.white,
      ),
      child: Scaffold(
         backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation:0.0,
          leading: Icon(Icons.arrow_back_ios, color: Color(0xFF1E4E5F),),
          title: Text("Leaderboard"),
          titleTextStyle: TextStyle(color: Color(0xFF1E4E5F),),
          centerTitle: true,
          
          actions: [Icon(Icons.grid_view, color: Color(0xFF1E4E5F),),],
        ),
        body: Column(
          children:[
          //Row1
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Today'),
              Category(),
              Text('Month'),
              
            ],
          ),
          //Row2
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Crown()
            ]
          ),
          //Row3
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //Text('data'),
              TopThree()
            ],
          )
          ]
            
        ),
       
      ),
    );
  }
}

class Category extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.0,
      width:70.0,
      decoration: BoxDecoration(
        color: Colors.teal[100],
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Week')
        ],
      ),
    );
  }
  
}

//ignore: use_key_in_widget_constructors
class TopThree extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      width: 100.0,
      decoration: BoxDecoration(
        border: Border.all(width: 4, color: Colors.teal),
        boxShadow: [
          BoxShadow(
            color: Colors.teal,
            spreadRadius: 3,
            blurRadius: 10,
          ),
           BoxShadow(
            color: Colors.teal,
            spreadRadius: -3,
            blurRadius: 5,
          )
        ],
          image: DecorationImage(
          image: AssetImage(
              'assets/leaderboard/Top1.jpg'),
          fit: BoxFit.fill,
        ),
       borderRadius: BorderRadius.all(Radius.circular(50))
      ),
      //child:Image.asset('assets/leaderboard/Top1.jpg'),
    );
  }

}

class Crown extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
     width: 50.0,
        decoration: BoxDecoration(
           image: DecorationImage(
          image: AssetImage(
              'assets/leaderboard/crown.png'),
          fit: BoxFit.fill,
        ),
        )
    );
  }

}



// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors



import 'package:flutter/material.dart';


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
          
          actions: [Icon(Icons.emoji_events, color: Color(0xFF1E4E5F),),],
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
          Row(
            children: [
              EmptyRow()
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
           Row(
            children: [
              EmptyRow()
            ],
          ),
          //Row3
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Top2(),
              Top1(),
              Top3(),
            ],
          ),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:<Widget>[
              Number2(),
             Number1(),
             Number3()
              
            ]
          ),
          Row(
            children: [
              EmptyRow()
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            Text('@user123'),
            Text('@user123'),
            Text('@user123'),
            ],
          ),
          
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


class Top1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      width: 100.0,
      decoration: BoxDecoration(
        border: Border.all(width: 3, color: Color(0xFFFFB156)),
        boxShadow: [
          BoxShadow(
            color: Color(0xFFFFB156),
            spreadRadius: 3,
            blurRadius: 10,
          ),
           BoxShadow(
            color: Color(0xFFFFB156),
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

class Top2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      width: 80.0,
      decoration: BoxDecoration(
        border: Border.all(width: 3, color: Color(0xFF1E4E5F)),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF1E4E5F),
            spreadRadius: 3,
            blurRadius: 10,
          ),
           BoxShadow(
            color: Color(0xFF1E4E5F),
            spreadRadius: -3,
            blurRadius: 5,
          )
        ],
          image: DecorationImage(
          image: AssetImage(
              'assets/leaderboard/Top2.jpg'),
          fit: BoxFit.fill,
        ),
       borderRadius: BorderRadius.all(Radius.circular(50))
      ),
      //child:Image.asset('assets/leaderboard/Top1.jpg'),
    );
  }

}

class Top3 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      width: 80.0,
      decoration: BoxDecoration(
        border: Border.all(width: 3, color: Color(0xFF1E4E5F)),
        boxShadow: [
          BoxShadow(
            color:Color(0xFF1E4E5F),
            spreadRadius: 3,
            blurRadius: 10,
          ),
           BoxShadow(
            color: Color(0xFF1E4E5F),
            spreadRadius: -3,
            blurRadius: 5,
          )
        ],
          image: DecorationImage(
          image: AssetImage(
              'assets/leaderboard/Top3.jpg'),
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

class Number1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      height:40,
      width:40,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              'assets/leaderboard/no1.png'),
          fit: BoxFit.fill,
      ),
      )
    );
  }

}

class Number2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      height:40,
      width:40,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              'assets/leaderboard/no2.png'),
          fit: BoxFit.fill,
      ),
      )
    );
  }

}


class Number3 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      height:40,
      width:40,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              'assets/leaderboard/no3.png'),
          fit: BoxFit.fill,
      ),
      )
    );
  }

}

class Usernames extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
        child : Row(
          children: [
            
          ],
        )
    );
  }

}

class EmptyRow extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      height:10,
      width:10,
    );
  }

}




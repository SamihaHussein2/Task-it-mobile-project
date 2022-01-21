// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import '../navscreens/main_page.dart';
import '/screens/leaderboard/animated_buttons.dart';
import '/screens/trophies.dart';
import 'package:games_services/games_services.dart';

class LeaderBoardScreen extends StatefulWidget {
  @override
  State<LeaderBoardScreen> createState() => _LeaderBoardScreenState();
}

class _LeaderBoardScreenState extends State<LeaderBoardScreen> {
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
          elevation: 0.0,
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Color(0xFF1E4E5F)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MainPage()),
                );
              }),
          title: Text("Leaderboard"),
          titleTextStyle: TextStyle(
              color: Color(0xFF1E4E5F),
              fontSize: 20,
              fontWeight: FontWeight.bold),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(
                Icons.emoji_events,
                color: Color(0xFF1E4E5F),
              ),
              iconSize: 30,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TrophiesScreen()),
                );
              },
            )
          ],
        ),
        body: Column(children: [
          //Row1

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimatedBtnToday(),
              AnimatedBtnWeek(),
              AnimatedBtnMonth()
            ],
          ),
          Row(
            children: [EmptyRow()],
          ),
          //Row2
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [Crown()]),
          Row(
            children: [EmptyRow()],
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
              children: <Widget>[]),
          Row(
            children: [EmptyRow()],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Joseph',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
              Text('Sarah',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
              Text('Amy',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold))
            ],
          ),
          Row(
            children: [EmptyRow()],
          ),
          FriendList(),
        ]),
      ),
    );
  }
}

class Category extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.0,
      width: 70.0,
      decoration: BoxDecoration(
        color: Colors.teal[100],
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text('Week')],
      ),
    );
  }
}

class Top1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
        fit: StackFit.passthrough,
        alignment: Alignment.topCenter,
        overflow: Overflow.clip,
        clipBehavior: Clip.hardEdge,
        children: <Widget>[
          ClipOval(
            clipBehavior: Clip.hardEdge,
            child: Image.asset(
              'assets/leaderboard/Top1.jpg',
              fit: BoxFit.cover,
              width: 95,
              height: 99,
            ),
          ),
          ClipOval(
            clipBehavior: Clip.hardEdge,
            child: Image.asset(
              'assets/leaderboard/no1.png',
              fit: BoxFit.fitHeight,
              width: 120,
              height: 120,
            ),
          ),
        ]);
  }
}

class Top2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
        fit: StackFit.loose,
        alignment: Alignment.topCenter,
        overflow: Overflow.clip,
        clipBehavior: Clip.hardEdge,
        children: <Widget>[
          ClipOval(
            clipBehavior: Clip.hardEdge,
            child: Image.asset(
              'assets/leaderboard/Top2.jpg',
              fit: BoxFit.cover,
              width: 92,
              height: 92,
            ),
          ),
          ClipOval(
            clipBehavior: Clip.hardEdge,
            child: Image.asset(
              'assets/leaderboard/no2.png',
              fit: BoxFit.cover,
              width: 100,
              height: 100,
            ),
          )
        ]);
  }
}

class Top3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return Container(
    //   height: 80.0,
    //   width: 80.0,
    //   decoration: BoxDecoration(
    //     border: Border.all(width: 3, color: Color(0xFF1E4E5F)),
    //     boxShadow: [
    //       BoxShadow(
    //         color:Color(0xFF1E4E5F),
    //         spreadRadius: 3,
    //         blurRadius: 10,
    //       ),
    //        BoxShadow(
    //         color: Color(0xFF1E4E5F),
    //         spreadRadius: -3,
    //         blurRadius: 5,
    //       )
    //     ],
    //       image: DecorationImage(
    //       image: AssetImage(
    //           'assets/leaderboard/Top3.jpg'),
    //       fit: BoxFit.fill,
    //     ),
    //    borderRadius: BorderRadius.all(Radius.circular(50))
    //   ),
    //   //child:Image.asset('assets/leaderboard/Top1.jpg'),
    // );
    return Stack(
        fit: StackFit.loose,
        alignment: Alignment.topCenter,
        overflow: Overflow.clip,
        clipBehavior: Clip.hardEdge,
        children: <Widget>[
          ClipOval(
            clipBehavior: Clip.hardEdge,
            child: Image.asset(
              'assets/leaderboard/Top3.jpg',
              fit: BoxFit.cover,
              width: 92,
              height: 92,
            ),
          ),
          ClipOval(
            clipBehavior: Clip.hardEdge,
            child: Image.asset(
              'assets/leaderboard/no3.png',
              fit: BoxFit.cover,
              width: 100,
              height: 100,
            ),
          )
        ]);
  }
}

class Crown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40.0,
        width: 50.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/leaderboard/crown.png'),
            fit: BoxFit.fill,
          ),
        ));
  }
}

class FriendList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        ListTile(
            title: Text("Adam"),
            leading: CircleAvatar(
                backgroundImage: AssetImage("assets/leaderboard/4.jpg")),
            trailing: Text('4')),
        ListTile(
            title: Text("Omar"),
            leading: CircleAvatar(
                backgroundImage: AssetImage("assets/leaderboard/5.jpg")),
            trailing: Text('5')),
        ListTile(
            title: Text("Salma"),
            leading: CircleAvatar(
                backgroundImage: AssetImage("assets/leaderboard/6.jpg")),
            trailing: Text('6')),
      ],
    );
  }
}

class EmptyRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      width: 10,
    );
  }
}

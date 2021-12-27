import 'package:flutter/material.dart';
import '/screens/leaderboard/leaderboard.dart';

class TrophiesScreen extends StatefulWidget {
  @override
  State<TrophiesScreen> createState() => _TrophiesScreenState();
}

class _TrophiesScreenState extends State<TrophiesScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Color(0xFF1E4E5F),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LeaderBoardScreen()),
            );
          },
        ),
        title: Text("Trophies"),
        titleTextStyle: TextStyle(
            color: Color(0xFF1E4E5F),
            fontSize: 20,
            fontWeight: FontWeight.bold),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
            children: [EmptyRow()],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Trophy1(),
              Trophy2(),
              Trophy3(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('1st Place',
                  style: TextStyle(
                    color: Colors.black,
                  )),
              Text('1st task',
                  style: TextStyle(
                    color: Colors.black,
                  )),
              Flexible(
                  child: new Text('3 tasks in 24hrs',
                      style: TextStyle(
                        color: Colors.black,
                      ))),
            ],
          ),
          Row(
            children: [EmptyRow()],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GreyTrophy(),
              GreyTrophy(),
              GreyTrophy(),
            ],
          ),
          Row(
            children: [EmptyRow()],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GreyTrophy(),
              GreyTrophy(),
              GreyTrophy(),
            ],
          )
        ],
      ),
    ));
  }
}

class Trophy1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 120,
      child: IconButton(
        icon: Image.asset('assets/trophies/trophy1.png'),
        onPressed: () {},
      ),
    );
  }
}

class Trophy2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 120,
      child: IconButton(
        icon: Image.asset('assets/trophies/trophy2.png'),
        onPressed: () {},
      ),
    );
  }
}

class Trophy3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 120,
      child: IconButton(
        icon: Image.asset('assets/trophies/trophy3.png'),
        onPressed: () {},
      ),
    );
  }
}

class GreyTrophy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 120,
      child: IconButton(
        icon: Image.asset('assets/trophies/grey_trophy.png'),
        onPressed: () {},
      ),
    );
  }
}

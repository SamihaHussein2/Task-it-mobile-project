import 'package:flutter/material.dart';

class AnimatedBtnToday extends StatefulWidget{
  @override
  State<AnimatedBtnToday> createState() => _AnimatedBtnTodayState();
}

class _AnimatedBtnTodayState extends State<AnimatedBtnToday> {
  @override
  Widget build(BuildContext context) {
    return Container(
             height: 40.0,
             width: 70.0,
             margin: EdgeInsets.all(10),
             child: RaisedButton(
               onPressed: () {},
               shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(40.0)),
               padding: EdgeInsets.all(0.0),
               child: Ink(
                 decoration: BoxDecoration(
                     gradient: LinearGradient(
                       colors: [Color(0xff1E4E5F), Color(0xff64B6FF)],
                       begin: Alignment.topLeft,
                       end: Alignment.centerRight,
                     ),
                     borderRadius: BorderRadius.circular(30.0)),
                 child: Container(
                   constraints:
                       BoxConstraints(maxWidth: 90.0, minHeight: 40.0),
                   alignment: Alignment.center,
                   child: Text(
                     "Today",
                     textAlign: TextAlign.center,
                     style: TextStyle(color: Colors.white, fontSize: 14),
                   ),
                 ),
               ),
             ),
           );
  }
}

class AnimatedBtnWeek extends StatefulWidget {
  @override
  State<AnimatedBtnWeek> createState() => _AnimatedBtnWeekState();
}

class _AnimatedBtnWeekState extends State<AnimatedBtnWeek> {
  @override
  Widget build(BuildContext context) {
    return Container(
             height: 40.0,
             width: 70.0,
             margin: EdgeInsets.all(10),
             child: RaisedButton(
               onPressed: () {},
               shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(40.0)),
               padding: EdgeInsets.all(0.0),
               child: Ink(
                 decoration: BoxDecoration(
                     gradient: LinearGradient(
                       colors: [Color(0xff1E4E5F), Color(0xff64B6FF)],
                       begin: Alignment.topLeft,
                       end: Alignment.centerRight,
                     ),
                     borderRadius: BorderRadius.circular(30.0)),
                 child: Container(
                   constraints:
                       BoxConstraints(maxWidth: 90.0, minHeight: 40.0),
                   alignment: Alignment.center,
                   child: Text(
                     "Week",
                     textAlign: TextAlign.center,
                     style: TextStyle(color: Colors.white, fontSize: 14),
                   ),
                 ),
               ),
             ),
           );
  }
}

class AnimatedBtnMonth extends StatefulWidget {
  @override
  State<AnimatedBtnMonth> createState() => _AnimatedBtnMonthState();
}

class _AnimatedBtnMonthState extends State<AnimatedBtnMonth> {
  @override
  Widget build(BuildContext context) {
    return Container(
             height: 40.0,
             width: 70.0,
             margin: EdgeInsets.all(10),
             child: RaisedButton(
               onPressed: () {},
               shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(40.0)),
               padding: EdgeInsets.all(0.0),
               child: Ink(
                 decoration: BoxDecoration(
                     gradient: LinearGradient(
                       colors: [Color(0xff1E4E5F), Color(0xff64B6FF)],
                       begin: Alignment.topLeft,
                       end: Alignment.centerRight,
                     ),
                     borderRadius: BorderRadius.circular(30.0)),
                 child: Container(
                   constraints:
                       BoxConstraints(maxWidth: 90.0, minHeight: 40.0),
                   alignment: Alignment.center,
                   child: Text(
                     "Month",
                     textAlign: TextAlign.center,
                     style: TextStyle(color: Colors.white, fontSize: 14),
                   ),
                 ),
               ),
             ),
           );
  }
}
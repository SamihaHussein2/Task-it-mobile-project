import 'package:flutter/material.dart';
import 'package:task_it/screens/Intro/welcome_page.dart';
import 'package:task_it/screens/homepage.dart';
import 'package:task_it/screens/leaderboard.dart';
import 'package:task_it/spalsh.dart';

class Option {
  final Icon icon;
  final String title;
  final location;

  Option({required this.icon, required this.title, required this.location});
}

final options = [
  Option(
    icon: Icon(Icons.person, size: 30.0),
    title: 'My Account',
    location: Splash(), //change to account page
  ),
  Option(
    icon: Icon(Icons.notifications_active, size: 30.0),
    title: 'Notifications',
    location: Splash(), //change to notification page
  ),
  Option(
    icon: Icon(Icons.emoji_events_rounded, size: 30.0),
    title: 'Trophies',
    location: LeaderBoardScreen(), //change to trophies page
  ),
  Option(
    icon: Icon(Icons.person_add_alt_1, size: 30.0),
    title:
        'Invite friends', //send link to friends in social media platforms (search lessa)
    location: Homepage(),
  ),
  Option(
    icon: Icon(Icons.logout_outlined, size: 30.0),
    title: 'Logout',
    location: Homepage(), //log out from account (law signed in)
  ),
];

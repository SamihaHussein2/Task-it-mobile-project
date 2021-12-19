import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import '../screens/homepage/homepage.dart';

// import '../constants.dart';
import '../enums.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
    required this.selectedMenu,
  }) : super(key: key);

  final NavBarMenu selectedMenu;

  @override
  Widget build(BuildContext context) {
    final Color inActiveIconColor = Color(0xFFB6B6B6);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(Icons.home),
                onPressed: () =>
                    Navigator.pushNamed(context, Homepage.routeName),
              ),
              IconButton(
                padding: new EdgeInsets.all(0.0),
                icon: Icon(Icons.add_circle_outline_outlined, size: 40),
                onPressed: () =>
                    Navigator.pushNamed(context, Homepage.routeName),
              ),
              IconButton(
                icon: Icon(Icons.category_rounded),
                onPressed: () =>
                    Navigator.pushNamed(context, Homepage.routeName),
              ),
            ],
          )),
    );
  }
}

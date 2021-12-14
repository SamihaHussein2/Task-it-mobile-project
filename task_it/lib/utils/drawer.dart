import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/screens/my_account.dart'; 
import '/screens/leaderboard.dart';
import '/screens/settings.dart'; 


class DrawerStateInfo with ChangeNotifier {
  int _currentDrawer = 0;
  int get getCurrentDrawer => _currentDrawer;

  void setCurrentDrawer(int drawer) {
    _currentDrawer = drawer;
    notifyListeners(); 
  }
}

class AppDrawer extends StatelessWidget {
  AppDrawer(this.currentPage);
  final String currentPage;

  @override
  Widget build(BuildContext context) {
    var currentDrawer = Provider.of<DrawerStateInfo>(context).getCurrentDrawer; 
    return Drawer(
      child: ListView(
        children: <Widget>[
          ListTile(
            title: Text('My Account', 
                         style: currentDrawer == 0
                         ? TextStyle(fontWeight: FontWeight.bold)
                         : TextStyle(fontWeight: FontWeight.normal),
                        ),
            trailing: Icon(Icons.arrow_forward),
            onTap: (){
              Navigator.of(context).pop(); 
              if(this.currentPage == 'My Account') return; 

              Provider.of<DrawerStateInfo>(context).setCurrentDrawer(0); 
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder:(BuildContext context) => MyAccount(title: 'My Account')));


            }            
          ),
          ListTile(
            title: Text('Leaderboard', 
                         style: currentDrawer == 0
                         ? TextStyle(fontWeight: FontWeight.bold)
                         : TextStyle(fontWeight: FontWeight.normal),
                        ),
            trailing: Icon(Icons.arrow_forward),
            onTap: (){
              Navigator.of(context).pop(); 
              if(this.currentPage == 'Leaderboard') return; 

              Provider.of<DrawerStateInfo>(context).setCurrentDrawer(0); 
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder:(BuildContext context) => Leaderboard(title: 'Leaderboard')));


            }            
          ),
          ListTile(
            title: Text('Settings', 
                         style: currentDrawer == 0
                         ? TextStyle(fontWeight: FontWeight.bold)
                         : TextStyle(fontWeight: FontWeight.normal),
                        ),
            trailing: Icon(Icons.arrow_forward),
            onTap: (){
              Navigator.of(context).pop(); 
              if(this.currentPage == 'Settings') return; 

              Provider.of<DrawerStateInfo>(context).setCurrentDrawer(0); 
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder:(BuildContext context) => Settings(title: 'Settings')));


            }            
          ),
          
        ],
      )
    )
  }
}

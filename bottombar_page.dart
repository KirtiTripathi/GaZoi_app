import 'package:flutter/material.dart';
import 'package:gazoi_app/dashboard_page.dart';
import 'package:gazoi_app/generalpublic_page.dart';
import 'package:gazoi_app/healthcare_professionals_page.dart';
import 'package:gazoi_app/system_user_page.dart';

import 'drawer_page.dart';

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BottomBarPage(),
    );
  }
}
class BottomBarPage extends StatefulWidget {
  BottomBarPage({Key key}) : super(key: key);
  @override
  _BottomBarPageState createState() => _BottomBarPageState();
}

class _BottomBarPageState extends State<BottomBarPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
    List<Widget> _widgetOptions = <Widget>[
    DashboardPage(),
    GeneralpublicPage(),
    HealthcarePage(),
    SystemUserPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: Drawer(
        child: DrawerPage(),
      ),
      appBar: AppBar(
        title:Text('System User',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
        backgroundColor: Colors.blue[700],
        leading: Icon(Icons.arrow_back),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search,color: Colors.white,size: 30,)),
          Padding(
            padding: const EdgeInsets.only(right:10.0),
            child: IconButton(icon:Icon(Icons.menu,color: Colors.white,size: 30,),
              onPressed: () {
                _scaffoldKey.currentState.openEndDrawer();
              },
            ),
          )
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.blueGrey,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.pie_chart,size: 30,),
            title: Text('DASHBOARD',style: TextStyle(fontSize: 10,fontWeight:FontWeight.w500),),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people,size: 30,),
            title: Text('GENERAL \n\t\tPUBLIC',style: TextStyle(fontSize: 10,fontWeight:FontWeight.w500)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_hospital,size: 30,),
            title: Text('\t\tHEALTHCARE\nPROFESSIONALS',style: TextStyle(fontSize: 10,fontWeight:FontWeight.w500)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person,size: 30,),
            title: Text('SYSTEM \n\t\tUSERS',style: TextStyle(fontSize: 10,fontWeight:FontWeight.w500)),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue[700],
        showUnselectedLabels: true,
        onTap: _onItemTapped,
      ),
    );
  }
}
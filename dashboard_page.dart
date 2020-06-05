import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Center(child: Padding(
            padding: EdgeInsets.only(top:40.0),
            child: Text('Dashbord',style: TextStyle(color: Colors.blue[800],fontWeight: FontWeight.w700,fontSize: 25),),
          ))
        ],
      ),
    );
  }
}

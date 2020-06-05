import 'package:flutter/material.dart';

class HealthcarePage extends StatelessWidget {
@override
Widget build(BuildContext context) {
  return Scaffold(
    body: Column(
      children: <Widget>[
        Center(child: Padding(
          padding: const EdgeInsets.only(top:40.0),
          child: Text('Health Care Professionals',style: TextStyle(color: Colors.blue[800],fontWeight: FontWeight.w700,fontSize: 25),),
        ))
      ],
    ),
  );
}
}
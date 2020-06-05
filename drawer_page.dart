import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              height: 100,
              color: Colors.blue[700],
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Center(
                    child: Text(
                  'Welcome to GaZoi',
                  style: TextStyle(
                      fontWeight: FontWeight.w700, color: Colors.white),
                )),
              )),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(Icons.person),
                SizedBox(
                  width: 10,
                ),
                Text('Profile')
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(Icons.settings),
                SizedBox(
                  width: 10,
                ),
                Text('Settings')
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(Icons.security),
                SizedBox(
                  width: 10,
                ),
                Text('Security')
              ],
            ),
          ),
        ],
      ),
    );
  }
}

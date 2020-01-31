


import 'package:application_paper/fristPage/mainPage.dart';
import 'package:flutter/material.dart';

class HasApplication extends StatefulWidget {
  @override
  _HasApplicationState createState() => _HasApplicationState();
}

class _HasApplicationState extends State<HasApplication> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              height: 250.00,
              child: Text(
                '该题目已被申请',
                style: TextStyle(
                  fontSize: 43.50,
                  color: Colors.redAccent,
                ),
              ),
            ),
            SizedBox(height: 10.00,),
            Material(
              child: RaisedButton(
                color: Colors.blue,
                child: new Text(
                  "返回",
                  style: new TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        ),
      ),
      /*floatingActionButton: FloatingActionButton(
        child: Icon(Icons.reply),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),*/
    );
  }
}

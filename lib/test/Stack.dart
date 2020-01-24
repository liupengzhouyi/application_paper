
import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}


class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "flutter Demo",
          ),
        ),
        body: Center(
          child: Container(
              child: Stack(
                // -1, 1
                alignment: Alignment(1,0),
                children: <Widget>[
                  Container(
                    height: 400.00,
                    width: 300.00,
                    color: Colors.green,
                  ),
                  Text(
                    "xxx",
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.deepPurpleAccent,
                    ),
                  ),
                ],
              ),
          ),
        ),
      ),
    );
  }
}
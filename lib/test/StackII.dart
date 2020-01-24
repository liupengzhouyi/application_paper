
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
              height: 400.00,
              width: 300.00,
              color: Colors.amberAccent,
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: Icon(Icons.build, size: 40, color: Colors.deepPurpleAccent,),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Icon(Icons.build, size: 40, color: Colors.deepPurpleAccent,),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Icon(Icons.build, size: 40, color: Colors.deepPurpleAccent,),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Icon(Icons.build, size: 40, color: Colors.deepPurpleAccent,),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Icon(Icons.build, size: 40, color: Colors.deepPurpleAccent,),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 30,
                    child: Icon(Icons.build, size: 40, color: Colors.deepPurpleAccent,),
                  ),
                ],
              ),
          ),
        ),
      ),
    );
  }
}
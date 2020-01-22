
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
        body: Container(
          child: AspectRatio(
            aspectRatio: 3.0/2.0,
            child: Container(
              color: Colors.deepPurple,
            ),
          ),
        ),
      ),
    );
  }
}
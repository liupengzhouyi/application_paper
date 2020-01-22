
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
              child: Text(
                "xxxxdecoration: BoxDecoratid"
                    "ecoration: BoxDecoratidecoration"
                    ": BoxDecoratideco"
                    "decoration: BoxDecorati"
                    "ration: BoxDecoratidecoration: BoxDecorati",
              )
          ),
        ),
      ),
    );
  }
}
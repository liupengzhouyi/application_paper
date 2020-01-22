
import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

class IconContainer extends StatelessWidget {

  double size = 32.00;

  Color color1 = Colors.blue;

  IconData icon;

  IconContainer(this.icon, {this.size, this.color1});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 100.00,
      width: 100.00,
      color: Colors.amberAccent,
      child: Center(
        child: Icon(icon, size: size, color: color1,),
      ),
    );
  }

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
          height: 600.00,
          width: 500.00,
          color: Colors.black26,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              IconContainer(Icons.accessibility, color1: Colors.green,),
              IconContainer(Icons.accessibility),
              IconContainer(Icons.accessibility,color1: Colors.deepPurpleAccent,),
            ],
          ),
        ),
      ),
    );
  }
}
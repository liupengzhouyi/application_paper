
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
            "flutter Card",
          ),
        ),
        body: ListView(
          children: <Widget>[
            Card(
              margin: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text("liupeng", style: TextStyle(fontSize: 20),),
                    subtitle: Text("高级工程师", style: TextStyle(fontSize: 15),),
                  ),
                  ListTile(
                    title: Text("phonoe number: 14747219744", style: TextStyle(fontSize: 15),),
                    subtitle: Text("高级工程师", style: TextStyle(fontSize: 15),),
                  )
                ],
              ),
            ),
            Card(
              margin: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text("liupeng", style: TextStyle(fontSize: 20),),
                    subtitle: Text("高级工程师", style: TextStyle(fontSize: 15),),
                  ),
                  Text("phonoe number: 14747219744", style: TextStyle(fontSize: 15,),),
                  Text("高级工程师", style: TextStyle(fontSize: 15),),
                ],
              ),
            ),
            Card(
              margin: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text("liupeng", style: TextStyle(fontSize: 20),),
                    subtitle: Text("高级工程师", style: TextStyle(fontSize: 15),),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage("https://i.loli.net/2020/01/22/8Xa1hoLzgjrDkJU.png",),
                    ),
                  ),
                  ListTile(
                    title: Text("phonoe number: 14747219744", style: TextStyle(fontSize: 15),),
                    subtitle: Text("高级工程师", style: TextStyle(fontSize: 15),),
                  ),
                ],
              ),
            ),
            Card(
              margin: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text("liupeng", style: TextStyle(fontSize: 20),),
                    subtitle: Text("高级工程师", style: TextStyle(fontSize: 15),),
                    leading: ClipOval(
                      child: Image.network("https://i.loli.net/2020/01/22/8Xa1hoLzgjrDkJU.png",fit: BoxFit.cover,),
                    ),
                  ),
                  ListTile(
                    title: Text("phonoe number: 14747219744", style: TextStyle(fontSize: 15),),
                    subtitle: Text("高级工程师", style: TextStyle(fontSize: 15),),
                  )
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}

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
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                child: GridView.count(
                    crossAxisCount: 3,
                    childAspectRatio: 1.7,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                        child: Image.network("https://i.loli.net/2020/01/22/8Xa1hoLzgjrDkJU.png",fit: BoxFit.cover,),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                        child: Image.network("https://i.loli.net/2020/01/22/8Xa1hoLzgjrDkJU.png",fit: BoxFit.cover,),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                        child: Image.network("https://i.loli.net/2020/01/22/8Xa1hoLzgjrDkJU.png",fit: BoxFit.cover,),
                      ),
                    ]
                )
              ),
          ),
        ),
      ),
    );
  }
}
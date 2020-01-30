
import 'package:application_paper/test/Navigator/state/ItemByLp.dart';
import 'package:application_paper/test/Navigator/state/SearchPage.dart';
import 'package:flutter/material.dart';

void main() => runApp(TestNavigator());

class TestNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Frist(),
    );
  }
}

class Frist extends StatefulWidget {
  @override
  _FristState createState() => _FristState();
}

class _FristState extends State<Frist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            child: Text('点击进入搜索页面'),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => SearchPage()
                  )
              );
            },
            color: Colors.amberAccent,
            textTheme: ButtonTextTheme.primary,
          ),
          RaisedButton(
            child: Text('点击进入搜索页面'),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => ShowPage(id: '12',),
                  )
              );
            },
            color: Colors.amberAccent,
            textTheme: ButtonTextTheme.primary,
          )
        ],
      ),
    );
  }
}

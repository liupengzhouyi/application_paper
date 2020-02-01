import 'package:flutter/material.dart';

class SystemApplication extends StatefulWidget {
  @override
  _MyApplicationState createState() => _MyApplicationState();
}

class _MyApplicationState extends State<SystemApplication> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('教师公告信息'),
        backgroundColor: Colors.greenAccent,
      ),
      body: Column(
        children: <Widget>[
          Text('暂无'),
        ],
      ),
    );
  }
}

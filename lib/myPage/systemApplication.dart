import 'package:flutter/material.dart';

class SystemApplication extends StatefulWidget {
  @override
  _SystemApplicationState createState() => _SystemApplicationState();
}

class _SystemApplicationState extends State<SystemApplication> {
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

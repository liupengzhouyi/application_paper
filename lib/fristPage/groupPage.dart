

import 'package:flutter/material.dart';

class Group extends StatefulWidget {
  @override
  _GroupState createState() => _GroupState();
}

class _GroupState extends State<Group> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('群组信息'),
        ),
        body: Text('群组信息'),
      ),
    );
  }
}

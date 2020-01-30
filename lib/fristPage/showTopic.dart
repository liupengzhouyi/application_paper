


import 'package:flutter/material.dart';

class ShowTopic extends StatefulWidget {
  @override
  _ShowTopicState createState() => _ShowTopicState();
}

class _ShowTopicState extends State<ShowTopic> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('选题信息'),
        ),
        body: Text('选题信息'),
      ),
    );
  }
}

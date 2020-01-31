
import 'package:flutter/material.dart';

class TopicInformation extends StatefulWidget {
  String teacher;

  String title;

  String date;


  TopicInformation({this.teacher, this.title, this.date});

  @override
  _TopicInformationState createState() => _TopicInformationState(title: this.title, teacher: this.teacher, date: this.date);
}

class _TopicInformationState extends State<TopicInformation> {

  String teacher;

  String title;

  String date;

  _TopicInformationState({this.teacher, this.title, this.date});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('个人详细信息'),
        backgroundColor: Colors.greenAccent,
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(10),
            child: Container(
              height: 40.00,
              child: Text('导师姓名 ${this.teacher}'),
            ),
          ),
          Card(
            margin: EdgeInsets.all(10),
            child: Container(
              height: 40.00,
              child: Text('题目 ${this.title}'),
            ),
          ),
          Card(
            margin: EdgeInsets.all(10),
            child: Container(
              height: 40.00,
              child: Text('日期 ${this.date}'),
            ),
          ),
        ],
      ),
    );
  }
}

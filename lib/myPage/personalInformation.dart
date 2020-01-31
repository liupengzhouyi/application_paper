


import 'package:flutter/material.dart';

class PersonalInformation extends StatefulWidget {

  String name = "";

  String number = "";

  String phoneNumber = "";

  PersonalInformation({this.name, this.number, this.phoneNumber});

  @override
  _PersonalInformationState createState() => _PersonalInformationState(name: this.name, number: this.number, phoneNumber: this.phoneNumber);
}

class _PersonalInformationState extends State<PersonalInformation> {

  String name = "";

  String number = "";

  String phoneNumber = "";

  _PersonalInformationState({this.name, this.number, this.phoneNumber});

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
              child: Text('姓名 ${this.name}'),
            ),
          ),
          Card(
            margin: EdgeInsets.all(10),
            child: Container(
              height: 40.00,
              child: Text('学号 ${this.number}'),
            ),
          ),
          Card(
            margin: EdgeInsets.all(10),
            child: Container(
              height: 40.00,
              child: Text('联系方式 ${this.phoneNumber}'),
            ),
          ),
        ],
      ),
    );
  }
}


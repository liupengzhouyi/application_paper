import 'package:flutter/material.dart';

class TeacherApplicationPage extends StatefulWidget {

  String teacherID;

  TeacherApplicationPage({this.teacherID});

  @override
  _TeacherApplicationPageState createState() => _TeacherApplicationPageState(teacherID: this.teacherID);
}

class _TeacherApplicationPageState extends State<TeacherApplicationPage> {

  String teacherID;

  _TeacherApplicationPageState({this.teacherID});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

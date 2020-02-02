
import 'package:flutter/material.dart';

void main() => runApp(TeacherLand());

class TeacherLand extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TeacherLanding(),
    );
  }

}


class TeacherLanding extends StatefulWidget {

  TeacherLanding({Key key}):super(key:key);

  @override
  _TeacherLandingState createState() => _TeacherLandingState();

}

class _TeacherLandingState extends State<TeacherLanding> {

  //定义一个controller
  TextEditingController _uNameController = TextEditingController();

  //定义一个controller
  TextEditingController _uPassController = TextEditingController();

  String _name = "";

  String _pass = "";

  void _incrementCounter() {
    setState(() {
      this._name = this._uNameController.text;
      this._pass = this._uPassController.text;
      print(_name + " - " + _pass);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Container(
          width: 250.00,
          child: Column(
            children: <Widget>[
              Container(
                child: TextField(
                  autofocus: true,
                  controller: _uNameController,
                  decoration: InputDecoration(
                    labelText: "教师编号",
                    hintText: "教师编号",
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
              ),
              Container(
                width: 250.00,
                child: TextField(
                  controller: _uPassController,
                  decoration: InputDecoration(
                    labelText: "密码",
                    hintText: "您的登录密码",
                    prefixIcon: Icon(Icons.lock),
                  ),
                  obscureText: true,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.file_upload),
      ),
      appBar: AppBar(
        title: Text("教师登陆"),
      ),
    );
  }
}
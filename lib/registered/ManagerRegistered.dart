
import 'package:flutter/material.dart';

void main() => runApp(ManagerRegistered());

class ManagerRegistered extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Landing(),
    );
  }
}

class Landing extends StatefulWidget {
  Landing({Key key}):super(key:key);
  @override
  _LandingState createState() => _LandingState();

}

class _LandingState extends State<Landing> {
  //定义一个controller
  TextEditingController _nameController = TextEditingController();
  //定义一个controller
  TextEditingController _phoneNumberController = TextEditingController();
  //定义一个controller
  TextEditingController _studentIDController = TextEditingController();
  String _name = "";
  String _phonenumber = "";
  String _studentid = "";

  void _incrementCounter() {
    setState(() {
      this._name = this._nameController.text;
      this._phonenumber = this._phoneNumberController.text;
      this._studentid = this._studentIDController.text;
      print(this._name + " - " + this._studentid + "-" + this._phonenumber);
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
                  controller: this._studentIDController,
                  decoration: InputDecoration(
                    labelText: "管理员编号",
                    hintText: "管理员编号",
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
              ),
              Container(
                width: 250.00,
                child: TextField(
                  controller: this._nameController,
                  decoration: InputDecoration(
                    labelText: "管理员姓名",
                    hintText: "实名制",
                    prefixIcon: Icon(Icons.lock),
                  ),
                ),
              ),
              Container(
                width: 250.00,
                child: TextField(
                  controller: this._phoneNumberController,
                  decoration: InputDecoration(
                    labelText: "联系方式",
                    hintText: "您的可接收短信息的联系方式",
                    prefixIcon: Icon(Icons.lock),
                  ),
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
        title: Text("管理员详细信息注册"),
      ),
    );
  }
}
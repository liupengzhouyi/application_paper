import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _ipAddress = 'Unknown';

  var _data = {
    "id": 0,
    "passwordvalue": 123456,
    "studentsid": "1667159125"
  };
  _getIPAddress() async {//1
    var url = 'http://123.56.167.84:8080/selection_of_college_graduation_design-0.0.1-SNAPSHOT/studentsLanding/landing';
    //var url = 'https://learnku.com/articles/31768';
    Dio _dio = Dio();
    String result;
      try {
      var response = await _dio.post(url,data: this._data);//2
      print(response.toString());

      if (response.statusCode == HttpStatus.ok) {
        var data= jsonDecode(response.toString());//3
        result = data['origin'];
      } else {
        result =
        'Error getting IP status ${response.statusCode}';
      }
    } catch (exception) {
      result =exception.toString();
    }
    if (!mounted) return;
    setState(() {
      _ipAddress = result;//4
    });
  }

  @override
  Widget build(BuildContext context) {
    var spacer = SizedBox(height: 10.0);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(100.0),
        child: Column(
          children: <Widget>[
            Text('IP地址为：'),
            spacer,
            Text('$_ipAddress'),
            spacer,
            RaisedButton(
              onPressed: _getIPAddress,
              child: Text('请求网络'),
            ),
          ],
        ),
      ),
    );
  }
}
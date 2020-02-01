import 'dart:io';
import 'package:application_paper/userInformation.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String contents = "123";


  @override
  void initState() {
    contents = decodePerson().toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text(
          this.contents,
          style: TextStyle(
            color: Colors.red,
            fontSize: 20.00,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.autorenew),
        onPressed: () {
          decodePerson();
        },
      ),
    );
  }


// 读取 assets 文件夹中的 person.json 文件
  Future<String> _loadPersonJson() async {
    return await rootBundle.loadString('assets/data/userInformation.json');
  }

// 将 json 字符串解析为 Person 对象
  Future<UserInformation> decodePerson() async {
    // 获取本地的 json 字符串
    String personJson = await _loadPersonJson();

    // 解析 json 字符串，返回的是 Map<String, dynamic> 类型
    final jsonMap = json.decode(personJson);

    print(jsonMap);

    UserInformation userInformation = UserInformation.fromJson(jsonMap);

    print(userInformation.toString());

    return userInformation;
  }

}


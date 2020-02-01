import 'dart:io';
import 'package:application_paper/landing/studentLanding.dart';
import 'package:application_paper/pojo/userInformation.dart';
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

  UserInformation userInformation;

  Widget page;

  @override
  void initState() {
    decodePerson();
  }

  @override
  Widget build(BuildContext context) {
    if(userInformation.landing == "0") {
      page = StudentLanding();
    } else if (userInformation.landing == "1") {
      // 真的校验登陆信息

    } else {
      page = noDataPage();
    }
    return Scaffold(
      body: Container(
        child:page,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.autorenew),
        onPressed: () {
          setState(() {
            if(userInformation.landing == "0") {
                page = StudentLanding();
            } else {
              page = noDataPage();
            }
          });
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
  void decodePerson() async {
    // 获取本地的 json 字符串
    String personJson = await _loadPersonJson();
    // 解析 json 字符串，返回的是 Map<String, dynamic> 类型
    final jsonMap = json.decode(personJson);
    //print(jsonMap);
    userInformation = UserInformation.fromJson(jsonMap);
    print(userInformation.toString());
    // return userInformation;
  }

  Widget noDataPage() {
    return Center(
      child: Container(
        width: 360.00,
        height: 240.00,
        child: Text(
          "自在校验登陆数据",
          style: TextStyle(
            color: Colors.redAccent,
          ),
        ),
      ),
    );
  }
}


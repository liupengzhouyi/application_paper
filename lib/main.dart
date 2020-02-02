import 'dart:io';
import 'package:application_paper/fristPage/mainPage.dart';
import 'package:application_paper/landing/StudentCheckLanding.dart';
import 'package:application_paper/landing/studentLanding.dart';
import 'package:application_paper/pojo/landing/StudentLanding/StudentLandingBean.dart';
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

  UserInformation userInformation = null;

  StudentCheckLanding studentCheckLanding;

  FloatingActionButton floatingActionButton;
  Widget page;

  @override
  void initState() {
    decodePerson();
    page = noDataPage("自在校验登陆数据");
  }

  @override
  Widget build(BuildContext context) {
    floatingActionButton = this.getFloatingActionButton();
    if (userInformation == null) {
      page = noDataPage("自在获取本地数据");
    } else {
      if(userInformation.landing == "0") {
        page = StudentLanding();
      } else if (userInformation.landing == "1") {
        CheckLanding();
      } else {
        page = noDataPage("自在校验登陆数据");
      }
    }
    return Scaffold(
      body: Container(
        child:page,
      ),
      floatingActionButton: this.floatingActionButton,
    );
  }

  // 真的校验登陆信息
  int CheckLanding() {
    // 构建对象
    StudentLandingBean studentLandingBean = new StudentLandingBean(studentsid: userInformation.id, passwordvalue: userInformation.password);
    if(studentCheckLanding == null) {
      studentCheckLanding = new StudentCheckLanding(studentLandingBean: studentLandingBean);
      setState(() {
        page = noDataPage("自在校验登陆数据");
      });
    } else {
      if(studentCheckLanding.returnStudentLandingBean == null) {
        setState(() {
          page = noDataPage("自在校验登陆数据");
        });
      } else {
        if (studentCheckLanding.returnStudentLandingBean.key == true) {
          setState(() {
            page = noDataPage("登陆验证成功");
            // 跳转首页
            floatingActionButton = FloatingActionButton(
              child: Icon(Icons.exit_to_app),
              onPressed: () {
                setState(() {
                  Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => MyMainApp(),
                      )
                  );
                });
                decodePerson();
              },
            );
          });
        } else {
          setState(() {
            page = noDataPage("登陆数据错误");
            // 跳转首页
            floatingActionButton = FloatingActionButton(
              child: Icon(Icons.exit_to_app),
              onPressed: () {
                setState(() {
                  Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => StudentLand(),
                      )
                  );
                });
                decodePerson();
              },
            );
          });
        }
      }
    }
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
    userInformation = UserInformation.fromJson(jsonMap);
  }

  Widget noDataPage(String string) {
    return Center(
      child: Container(
        width: 360.00,
        height: 500.00,
        child: Center(
          child: Container(
            child: Column(
              children: <Widget>[
                Image.asset("assets/images/1470137290773494.gif",fit: BoxFit.cover,),
                SizedBox(height: 50,),
                Text(string,
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.redAccent,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getFloatingActionButton() {
    return FloatingActionButton(
      child: Icon(Icons.autorenew),
      onPressed: () {
        setState(() {
          if(userInformation.landing == "0") {
            page = StudentLanding();
          } else {
            page = noDataPage("自在校验登陆数据");
          }
        });
      },
    );
  }

}


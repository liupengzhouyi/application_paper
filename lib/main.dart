import 'dart:io';
import 'package:application_paper/fristPage/mainPage.dart';
import 'package:application_paper/landing/LandingController.dart';
import 'package:application_paper/landing/StudentCheckLanding.dart';
import 'package:application_paper/landing/studentLanding.dart';
import 'package:application_paper/pojo/landing/StudentLanding/StudentLandingBean.dart';
import 'package:application_paper/pojo/userInformation.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'base/getUserInformation.dart';

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

  UserInformation _userInformation = new UserInformation();

  StudentCheckLanding studentCheckLanding;

  FloatingActionButton floatingActionButton;
  Widget page;

  @override
  void initState() {
    //decodePerson();
    page = noDataPage("正在校验登陆数据");
    floatingActionButton = this.getFloatingActionButton();
    /*
     * 调用_readCounter函数，读取点击数
     *  将点击数作为参数，创建一个函数
     */
    _readCounter();
  }

  @override
  Widget build(BuildContext context) {
    if (_userInformation == null) {
      page = noDataPage("正在获取本地数据");
    } else {
      if(_userInformation.landing == "0") {
        page = noDataPage("本地无登陆数据");
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
            // decodePerson();
          },
        );
      } else if (_userInformation.landing == "1") {
        CheckLanding();
      } else {
        page = noDataPage("正在校验登陆数据");
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
    StudentLandingBean studentLandingBean = new StudentLandingBean(studentsid: _userInformation.id, passwordvalue: _userInformation.password);
    if(studentCheckLanding == null) {
      studentCheckLanding = new StudentCheckLanding(studentLandingBean: studentLandingBean);
      setState(() {
        page = noDataPage("正在校验登陆数据");
      });
    } else {
      if(studentCheckLanding.returnStudentLandingBean == null) {
        setState(() {
          page = noDataPage("正在校验登陆数据");
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
                        builder: (context) => LandController(),
                      )
                  );
                });
                // decodePerson();
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
    _userInformation = UserInformation.fromJson(jsonMap);
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
          if(_userInformation.landing == "0") {
            page = StudentLanding();
          } else {
            page = noDataPage("自在校验登陆数据");
          }
        });
      },
    );
  }

  // _getLocalFile函数，获取本地文件目录
  Future<File> _getLocalFile() async {
    // 获取本地文档目录
    String dir = (await getApplicationDocumentsDirectory()).path;
    print(dir);
    // 返回本地文件目录
    return new File('$dir/userInformation.txt');
  }

  /*
   * _readCounter函数，读取点击数
   * 关键字async表示异步操作
   * 返回值Future类型，表示延迟处理的对象
   */
  void _readCounter() async {
    try {
      /*
       * 获取本地文件目录
       * 关键字await表示等待操作完成
       */
      File file = await _getLocalFile();
      var dir_bool = await file.exists();
      if (dir_bool) {
        print('true');
      } else {
        print('false');
        file.create();
        UserInformation userInformation = new UserInformation(landing: "0", registered: "0");
        saveValue(userInformation);
        this.initState();
      }
      // 从文件中读取变量作为字符串，一次全部读完存在内存里面
      var contents = await file.readAsString();
      print("=====---- :");
      print(contents);
      print("=====---- :");
      var jsonMap = await json.decode(contents);
      _userInformation = UserInformation.fromJson(jsonMap);
      print("=====---- :" + _userInformation.toString());
    } on FileSystemException {
    }
  }

  void saveValue(UserInformation userInformation) async {
    try {
      File f = await _getLocalFile();
      IOSink slink = f.openWrite(mode: FileMode.append);
      slink.write('${userInformation.toString()}');
      slink.close();
    } catch (e) {
      // 写入错误
      print(e);
    }
  }


}


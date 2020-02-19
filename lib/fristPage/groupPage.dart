

import 'dart:convert';
import 'dart:io';

import 'package:application_paper/chat/student/StudentGetGroup.dart';
import 'package:application_paper/chat/teacher/TeacherGetGroup.dart';
import 'package:application_paper/pojo/userInformation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class Group extends StatefulWidget {
  @override
  _GroupState createState() => _GroupState();
}

class _GroupState extends State<Group> {

  UserInformation _userInformation = new UserInformation();

  Widget page;

  FloatingActionButton floatingActionButton;

  @override
  void initState() {
    page = this.noDataPage("正在刷新数据");
    floatingActionButton = this.getFloatingActionButton();
    this._readCounter();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('群组信息'),
        ),
        body: page,
        floatingActionButton: this.floatingActionButton,
      ),
    );
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

  // _getLocalFile函数，获取本地文件目录
  Future<File> _getLocalFile() async {
    // 获取本地文档目录
    String dir = (await getApplicationDocumentsDirectory()).path;
    print(dir);
    // 返回本地文件目录
    return new File('$dir/userInformation.txt');
  }

  void _readCounter() async {
    try {
      /*
       * 获取本地文件目录
       * 关键字await表示等待操作完成
       */
      File file = await _getLocalFile();
      // 从文件中读取变量作为字符串，一次全部读完存在内存里面
      var contents = await file.readAsString();
      var jsonMap = await json.decode(contents);
      print(jsonMap);
      _userInformation = UserInformation.fromJson(jsonMap);
    } on FileSystemException {
    }
  }

  Widget getFloatingActionButton() {
    return FloatingActionButton(
      child: Icon(Icons.autorenew),
      onPressed: () {
        setState(() {
          if (this._userInformation != null) {
            if (this._userInformation.userType == "1") {
              // 学生
              Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => StudentGetGroup(studentId: _userInformation.id,),
                  )
              );
            }
            if (this._userInformation.userType == "2") {
              // 教师
              Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => TeacherGetGroup(teacherID: _userInformation.id,),
                  )
              );
            }
          }
        });
      },
    );
  }
}


import 'dart:convert';
import 'dart:io';

import 'package:application_paper/myPage/getLocdeInformation.dart';
import 'package:application_paper/myPage/studentApplication/StudentApplicationPage.dart';
import 'package:application_paper/myPage/tacherApplication/TeacherApplicationPage.dart';
import 'package:application_paper/pojo/userInformation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class MyApplication extends StatefulWidget {
  @override
  _MyApplicationState createState() => _MyApplicationState();
}

class _MyApplicationState extends State<MyApplication> {

  UserInformation userInformation;

  Widget page;

  FloatingActionButton floatingActionButton;
  @override
  void initState() {
    page = noDataPage("暂无数据");
    floatingActionButton = this.getFloatingActionButton();
    this.readCounter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.limeAccent,
        title: Text('我的申请信息', style: TextStyle(color: Colors.black),),
      ),
      body: page,
      floatingActionButton: floatingActionButton,
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

  FloatingActionButton getFloatingActionButton() {
    return FloatingActionButton(
      child: Icon(Icons.autorenew),
      onPressed: () {
        setState(() {
          if (userInformation == null) {
            page = noDataPage("正在查询数据");
          } else {
            if(userInformation.userType == "1") {
              page = StudentApplicationPage(studentId: userInformation.id,);
              floatingActionButton = null;
            } else if (userInformation.userType == "2"){
              print('222222');
              page = TeacherApplicationPage(teacherID: userInformation.id,);
              floatingActionButton = null;
            } else {
              page = noDataPage("暂无数据");
            }
          }
        });
      },
    );
  }

  // _getLocalFile函数，获取本地文件目录
  Future<File> _getLocalFile() async {
    // 获取本地文档目录
    String dir = (await getApplicationDocumentsDirectory()).path;
    // print(dir);
    // 返回本地文件目录
    return new File('$dir/userInformation.txt');
  }

  void readCounter() async {
    try {
      File file = await _getLocalFile();
      // 从文件中读取变量作为字符串，一次全部读完存在内存里面
      var contents = await file.readAsString();
      var jsonMap = await json.decode(contents);
      this.userInformation = UserInformation.fromJson(jsonMap);
    } on FileSystemException {
    }
  }

}

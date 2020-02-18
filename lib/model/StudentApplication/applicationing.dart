
import 'dart:convert';
import 'dart:io';

import 'package:application_paper/pojo/student/ReturnStudentApplicationPaperBean.dart';
import 'package:application_paper/pojo/student/StudentApplicationPaperBean.dart';
import 'package:application_paper/pojo/userInformation.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class StudentApplicationPaper extends StatefulWidget {

  String paperID;

  StudentApplicationPaper({this.paperID});

  @override
  _State createState() => _State(paperID: this.paperID);
}

class _State extends State<StudentApplicationPaper> {

  String paperID;

  UserInformation _userInformation;

  StudentApplicationPaperBean studentApplicationPaperBean;

  ReturnStudentApplicationPaperBean returnStudentApplicationPaperBean = null;

  _State({this.paperID});

  Widget page;

  FloatingActionButton floatingActionButton;

  @override
  void initState() {
    page = noDataPage('正在获取个人信息');
    this.floatingActionButton = this.getFloatingActionButton();
  }

  @override
  Widget build(BuildContext context){
    _readCounter();
    return Scaffold(
      /*appBar: AppBar(
        title: Text('申请毕业设计题目'),
        backgroundColor: Colors.lightGreen,
      ),*/
      body: page,
      floatingActionButton: this.floatingActionButton,
    );
  }

  void postHttp() async {
    print('now:' + studentApplicationPaperBean.toString());
    try{
      var response = await Dio().post(
        'http://123.56.167.84:8080/selection_of_college_graduation_design-0.0.1-SNAPSHOT/applicationPaper/add',
        data: this.studentApplicationPaperBean.toJson(),
      );
      this.returnStudentApplicationPaperBean = ReturnStudentApplicationPaperBean.fromJson(response.data);
      print(this.returnStudentApplicationPaperBean);
    }catch(e){
      return null;
    }
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
        if (_userInformation == null) {
          setState(() {
            page = noDataPage('正在获取个人信息');
          });
        } else {
          setState(() {
            // 构建实体
            studentApplicationPaperBean = new StudentApplicationPaperBean(id: 0, ispass: "0", paperid: this.paperID, studentid: this._userInformation.id);
            postHttp();
            page = noDataPage('正在申请题目');
            this.floatingActionButton = getFloatingActionButtonI();
          });
        }
      },
    );
  }

  FloatingActionButton getFloatingActionButtonI() {
    return FloatingActionButton(
      child: Icon(Icons.autorenew),
      onPressed: () {
        if (studentApplicationPaperBean == null) {
          setState(() {
            page = noDataPage('正在申请题目');
          });
        } else {
          setState(() {
            page = noDataPage('正在获取申请结果');
            this.floatingActionButton = getFloatingActionButtonII();
          });
        }
      },
    );
  }

  FloatingActionButton getFloatingActionButtonII() {
    return FloatingActionButton(
      child: Icon(Icons.autorenew),
      onPressed: () {
        if (returnStudentApplicationPaperBean == null) {
          setState(() {
            page = noDataPage('正在获取申请结果');
          });
        } else {
          setState(() {
            if (returnStudentApplicationPaperBean.key == true) {
              // 申请成功
              page = noDataPage('申请成功');
              this.floatingActionButton = getFloatingActionButtonIII();
            } else {
              // 申请失败
              page = noDataPage('申请失败');
              this.floatingActionButton = getFloatingActionButtonIII();
            }
          });
        }
      },
    );
  }

  FloatingActionButton getFloatingActionButtonIII() {
    return FloatingActionButton(
        child: Icon(Icons.reply),
        onPressed: () {
          Navigator.of(context).pop();
        },
    );
  }
}

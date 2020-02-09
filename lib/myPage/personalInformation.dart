


import 'dart:convert';
import 'dart:io';

import 'package:application_paper/pojo/student/getStudentInformation/GetStudentInformationBean.dart';
import 'package:application_paper/pojo/student/getStudentInformation/ReturnGetStudentInformationBean.dart';
import 'package:application_paper/pojo/teacher/getTeacherInformation/GetTeacherInformationBean.dart';
import 'package:application_paper/pojo/teacher/getTeacherInformation/ReturnGetTeacherInformationBean.dart';
import 'package:application_paper/pojo/userInformation.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class PersonalInformation extends StatefulWidget {

  String name = "";

  String number = "";

  String phoneNumber = "";

  PersonalInformation();

  @override
  _PersonalInformationState createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> {

  String name = "";

  String number = "";

  String phoneNumber = "";

  var jsonMap;

  _PersonalInformationState();

  UserInformation _userInformation;

  FloatingActionButton floatingActionButton;

  GetStudentInformationBean getStudentInformationBean;

  ReturnGetStudentInformationBean returnGetStudentInformationBean;

  GetTeacherInformationBean getTeacherInformationBean;

  ReturnGetTeacherInformationBean returnGetTeacherInformationBean;


  @override
  void initState() {
    this.floatingActionButton = this.getFloatingActionButton();
    _readCounter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('个人详细信息'),
        backgroundColor: Colors.greenAccent,
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.perm_identity, color: Colors.blue, size: 35.00,),
            title: Text('${this.name}', style: TextStyle(fontSize: 30.00),),
            // trailing: Image.network("https://i.loli.net/2020/01/22/8Xa1hoLzgjrDkJU.png"),
          ),
          ListTile(
            leading: Icon(Icons.assignment_ind, color: Colors.deepPurpleAccent, size: 35.00,),
            title: Text('${this.number}', style: TextStyle(fontSize: 30.00),),
            // trailing: Image.network("https://i.loli.net/2020/01/22/8Xa1hoLzgjrDkJU.png"),
          ),
          ListTile(
            leading: Icon(Icons.phone, color: Colors.green, size: 35.00,),
            title: Text('${this.phoneNumber}', style: TextStyle(fontSize: 30.00),),
            // trailing: Image.network("https://i.loli.net/2020/01/22/8Xa1hoLzgjrDkJU.png"),
          ),
          /*Card(
            margin: EdgeInsets.all(10),
            child: Container(
              height: 40.00,
              child: Text('姓名 ${this.name}'),
            ),
          ),
          Card(
            margin: EdgeInsets.all(10),
            child: Container(
              height: 40.00,
              child: Text('编号 ${this.number}'),
            ),
          ),
          Card(
            margin: EdgeInsets.all(10),
            child: Container(
              height: 40.00,
              child: Text('联系方式 ${this.phoneNumber}'),
            ),
          ),*/
        ],
      ),
      floatingActionButton: this.floatingActionButton,
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
      // 从文件中读取变量作为字符串，一次全部读完存在内存里面
      var contents = await file.readAsString();
      jsonMap = await json.decode(contents);
      _userInformation = UserInformation.fromJson(jsonMap);
      if (_userInformation.userType == "1") {
        this.getStudentInformationBean = new GetStudentInformationBean(string: _userInformation.id);
        this.postHttp1();
      } else if (_userInformation.userType == "2") {
        this.getTeacherInformationBean = new GetTeacherInformationBean(string: _userInformation.id);
        this.postHttp2();
      } else if (_userInformation.userType == "3") {
        // this.getTeacherInformationBean = new GetTeacherInformationBean(string: _userInformation.id);
      }
    } on FileSystemException {
    }
  }

  // 获取学生信息
  void postHttp1() async {
    try{
      var response = await Dio().post(
        'http://123.56.167.84:8080/selection_of_college_graduation_design-0.0.1-SNAPSHOT/studentsDetailsInformation/findByStudentID',
        data: this.getStudentInformationBean.toJson(),
      );
      print(response);
      this.returnGetStudentInformationBean = ReturnGetStudentInformationBean.fromJson(response.data);
    }catch(e){
      returnGetStudentInformationBean = null;
    }
  }

  void createStudent() {
    this.name = this.returnGetStudentInformationBean.returnObject[0].name;
    this.number = this.returnGetStudentInformationBean.returnObject[0].studentid;
    this.phoneNumber = this.returnGetStudentInformationBean.returnObject[0].phonenumber;
  }

  // 获取教师信息
  void postHttp2() async {
    try{
      var response = await Dio().post(
        'http://123.56.167.84:8080/selection_of_college_graduation_design-0.0.1-SNAPSHOT/teachersDetailsInformation/findByTeacherID',
        data: this.getTeacherInformationBean.toJson(),
      );
      this.returnGetTeacherInformationBean = ReturnGetTeacherInformationBean.fromJson(response.data);
      print(returnGetTeacherInformationBean.returnObject[0].toJson());
    }catch(e){
      returnGetStudentInformationBean = null;
    }
  }

  void createTeacher() {
    this.name = this.returnGetTeacherInformationBean.returnObject[0].name;
    this.number = this.returnGetTeacherInformationBean.returnObject[0].teacherid;
    this.phoneNumber = this.returnGetTeacherInformationBean.returnObject[0].phonenumber;
  }

  FloatingActionButton getFloatingActionButton() {
    return FloatingActionButton(
      child: Icon(Icons.autorenew),
      onPressed: () {
        print(_userInformation.toJson());
        setState(() {
          if (_userInformation.userType == "1") {
            this.createStudent();
            floatingActionButton = null;
          } else if (_userInformation.userType == "2") {
            this.createTeacher();
            floatingActionButton = null;
          } else if (_userInformation.userType == "3") {
            // this.getTeacherInformationBean = new GetTeacherInformationBean(string: _userInformation.id);
            floatingActionButton = null;
          }
        });
      },
    );
  }
}


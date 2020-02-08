import 'package:application_paper/pojo/teacher/ReturnTeacherApplicationPaperBean.dart';
import 'package:application_paper/pojo/teacher/TeacherApplicationPaperBean.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class TeacherApplicationPage extends StatefulWidget {

  String teacherID;

  TeacherApplicationPage({this.teacherID});

  @override
  _TeacherApplicationPageState createState() => _TeacherApplicationPageState(teacherID: this.teacherID);
}

class _TeacherApplicationPageState extends State<TeacherApplicationPage> {

  String teacherID;

  TeacherApplicationPaperBean teacherApplicationPaperBean;

  ReturnTeacherApplicationPaperBean returnTeacherApplicationPaperBean;

  Widget page;

  FloatingActionButton floatingActionButton;

  _TeacherApplicationPageState({this.teacherID}) {
    this.teacherApplicationPaperBean = new TeacherApplicationPaperBean(string: teacherID);
  }


  @override
  void initState() {
    this.postHttp();
    page = this.noDataPage("正在查询");
    this.floatingActionButton = this.getFloatingActionButton();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: page,
      floatingActionButton: floatingActionButton,
    );
  }

  FloatingActionButton getFloatingActionButton() {
    return FloatingActionButton(
      child: Icon(Icons.autorenew),
      onPressed: () {
        setState(() {
          if (this.returnTeacherApplicationPaperBean != null) {
            if (this.returnTeacherApplicationPaperBean.returnObject.length != 0) {
              // page = StudentApplicationList(listReturnObject: returnStudentApplicationPaper.toJson()['returnObject'],);
              this.floatingActionButton = null;
            } else {
              page = noDataPage("没有你的申请信息");
            }
          }
        });
      },
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

  void postHttp() async {
    try{
      var response = await Dio().post(
        'http://123.56.167.84:8080/selection_of_college_graduation_design-0.0.1-SNAPSHOT/applicationPaper/studentGet',
        data: this.teacherApplicationPaperBean.toJson(),
      );
      this.returnTeacherApplicationPaperBean = ReturnTeacherApplicationPaperBean.fromJson(response.data);
      print(response);
      print(returnTeacherApplicationPaperBean.toJson());
      print(returnTeacherApplicationPaperBean.toJson()['returnObject']);
    }catch(e){
      returnTeacherApplicationPaperBean = null;
    }
  }
}


import 'package:application_paper/model/StudentApplication/StudentApplicationList.dart';
import 'package:application_paper/pojo/myApplicationPaper/ReturnApplicationPaperBean.dart';
import 'package:application_paper/pojo/myApplicationPaper/StudentApplicationPaperBean.dart';
import 'package:application_paper/pojo/myApplicationPaper/studentSelect/ReturnStudentApplicationPaper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class StudentApplicationPage extends StatefulWidget {

  String studentId;

  StudentApplicationPage({this.studentId});

  @override
  _StudentApplicationPageState createState() => _StudentApplicationPageState(studentId: studentId);
}

class _StudentApplicationPageState extends State<StudentApplicationPage> {

  String studentId;

  StudentApplicationPaperBean studentApplicationPaperBean;

  _StudentApplicationPageState({this.studentId});

  Widget page;

  // 返回学生查询论文信息
  ReturnStudentApplicationPaper returnStudentApplicationPaper;

  FloatingActionButton floatingActionButton;

  @override
  void initState() {
    this.studentApplicationPaperBean = new StudentApplicationPaperBean(string: this.studentId);
    this.postHttp();
    page = noDataPage("正在查询");
    floatingActionButton = this.getFloatingActionButton();
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
      child: Icon(Icons.av_timer),
      onPressed: () {
        setState(() {
          if (returnStudentApplicationPaper != null) {
            if (returnStudentApplicationPaper.returnObject.length != 0) {
              page = StudentApplicationList(listReturnObject: returnStudentApplicationPaper.toJson()['returnObject'],);
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
        data: this.studentApplicationPaperBean.toJson(),
      );
      this.returnStudentApplicationPaper = ReturnStudentApplicationPaper.fromJson(response.data);
      print(response);
      print(returnStudentApplicationPaper.toJson());
      print(returnStudentApplicationPaper.toJson()['returnObject']);
    }catch(e){
      returnStudentApplicationPaper = null;
    }
  }

}

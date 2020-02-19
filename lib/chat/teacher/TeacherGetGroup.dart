import 'package:application_paper/model/group/teacherGroup/TeacherGroupListItem.dart';
import 'package:application_paper/pojo/teacher/teacherGetGroup/ReturnObject.dart';
import 'package:application_paper/pojo/teacher/teacherGetGroup/ReturnTeacherGetGroupBean.dart';
import 'package:application_paper/pojo/teacher/teacherGetGroup/TeacherIDBean.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class TeacherGetGroup extends StatefulWidget {

  String teacherID;

  TeacherGetGroup({this.teacherID});

  @override
  _TeacherGetGroupState createState() => _TeacherGetGroupState(teacherID: this.teacherID);
}

class _TeacherGetGroupState extends State<TeacherGetGroup> {

  String teacherID;

  TeacherIDBean teacherIDBean;

  _TeacherGetGroupState({this.teacherID}) {
    this.teacherIDBean = new TeacherIDBean(string: this.teacherID);
  }

  ReturnTeacherGetGroupBean returnTeacherGetGroupBean;

  Widget page;

  List<TeacherGroupListItem> list;

  @override
  void initState() {
    page = noDataPage("");
    this.postHttp();
  }

  @override
  Widget build(BuildContext context) {
    return page;
  }

  postHttp() async {
    try{
      var response = await Dio().post(
        'http://123.56.167.84:8080/selection_of_college_graduation_design-0.0.1-SNAPSHOT/groupRelationship/findByTeacherID',
        data: this.teacherIDBean.toJson(),
      );
      this.returnTeacherGetGroupBean =  ReturnTeacherGetGroupBean.fromJson(response.data);
      print(returnTeacherGetGroupBean.toString());
      if (this.returnTeacherGetGroupBean.key) {
        // 确定查询到
        setState(() {
          this.list = new List<TeacherGroupListItem>();
          for(ReturnObject returnObject in returnTeacherGetGroupBean.returnObject) {
            TeacherGroupListItem teacherGroupListItem = new TeacherGroupListItem(returnObject: returnObject,);
            list.add(teacherGroupListItem);
          }
          this.page = ListView(padding: EdgeInsets.all(10), children: this.list,);
        });
      } else {
        setState(() {
          this.page = noDataPage('没有您的聊天群组');
        });
      }
    }catch(e){
      return null;
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
}

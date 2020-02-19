
import 'package:application_paper/chat/ChatInformation.dart';
import 'package:application_paper/model/group/studentGroup/studentGroupListItem.dart';
import 'package:application_paper/pojo/student/StudentIDBean.dart';
import 'package:application_paper/pojo/student/studentGetGroup/ReturnObject.dart';
import 'package:application_paper/pojo/student/studentGetGroup/RetrunStudentGetGroupBean.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';


void main() => runApp(Lll());

class Lll extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('123'),),
        body: StudentGetGroup(studentId: '1667159125',),
      ),
    );
  }

}


class StudentGetGroup extends StatefulWidget {

  String studentId;

  StudentGetGroup({this.studentId});

  @override
  _StudentGetGroupState createState() => _StudentGetGroupState(studentId: this.studentId);
}

class _StudentGetGroupState extends State<StudentGetGroup> {

  String studentId;

  StudentIDBean studentIDBean;

  _StudentGetGroupState({this.studentId}) {
    this.studentIDBean = StudentIDBean(string: studentId);
  }

  RetrunStudentGetGroupBean retrunStudentGetGroupBean;

  Widget page;

  List<ListTile> list;

  @override
  void initState() {
    page = noDataPage("");
    this.postHttp(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("群组信息"),),
      body: page,
    );
  }

  postHttp(BuildContext context) async {
    try{
      var response = await Dio().post(
        'http://123.56.167.84:8080/selection_of_college_graduation_design-0.0.1-SNAPSHOT/groupNumber/findStudentGroupInformationByStudentID',
        data: this.studentIDBean.toJson(),
      );
      this.retrunStudentGetGroupBean =  RetrunStudentGetGroupBean.fromJson(response.data);
      print(retrunStudentGetGroupBean.toString());
      if (this.retrunStudentGetGroupBean.key) {
        // 确定查询到
        setState(() {
          this.list = new List<ListTile>();
          for(ReturnObject returnObject in retrunStudentGetGroupBean.returnObject) {
            // StudentGroupListItem studentGroupListItem = new StudentGroupListItem(returnObject: returnObject, studentID: this.studentId, context1: context,);
            ListTile listTile = ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage('https://ae01.alicdn.com/kf/Uc5a32bfb96ae41a4ab2f54bf1eb94abeL.jpg'),
              ),
              title: Text('${returnObject.groupName}', style: TextStyle(fontSize: 30), overflow: TextOverflow.ellipsis,),
              trailing: Icon(Icons.navigate_next, color: Colors.red,),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => GetChatInformation(groupID: returnObject.groupID, bodyID: this.studentId, groupName: returnObject.groupName, idtype: 1,),
                    )
                );
              },
            );
            list.add(listTile);
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

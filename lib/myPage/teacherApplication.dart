import 'package:application_paper/model/TacherAD/ADListItem.dart';
import 'package:application_paper/pojo/teacher/TeacherAd/ReturnAllTeacherAdBean.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:application_paper/pojo/teacher/TeacherAd/ReturnObject.dart';

class TeacherApplication extends StatefulWidget {
  @override
  _TeacherApplicationState createState() => _TeacherApplicationState();
}

class _TeacherApplicationState extends State<TeacherApplication> {

  List<ReturnObject> list;

  List<TeacherADListItem> listTeacherADListItem;

  Widget page;

  FloatingActionButton floatingActionButton;

  @override
  void initState() {
    this.getHttp();
    this.page = noDataPage('正在刷新数据');
    this.floatingActionButton = getFloatingActionButton();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('教师公告')),
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

  Widget hasDataPage() {
    return Container(
      child: ListView(
        padding: EdgeInsets.all(10),
        children: this.listTeacherADListItem,
      ),
    );
  }


  void createList() {
    listTeacherADListItem = new List();
    for (ReturnObject item in list) {
      TeacherADListItem teacherADListItem = new TeacherADListItem(returnObject: item,);
      this.listTeacherADListItem.add(teacherADListItem);
    }
  }

  Widget getFloatingActionButton() {
    return FloatingActionButton(
      child: Icon(Icons.autorenew),
      onPressed: () {
        setState(() {
          if (list != null) {
            page = noDataPage("正在构建列表");
          }
          if (listTeacherADListItem != null) {
            page = hasDataPage();
            floatingActionButton = null;
          }
        });
      },
    );
  }

  getHttp() async {
    try{
      var response = await Dio().post(
        'http://123.56.167.84:8080/selection_of_college_graduation_design-0.0.1-SNAPSHOT/teacherAnnouncement/getAll',
      );
      print(response.data['whatYourDo']);
      print(response.data['returnObject']);
      ReturnAllTeacherAdBean returnAllTeacherAdBean = ReturnAllTeacherAdBean.fromJson(response.data);
      print(returnAllTeacherAdBean);
      list = returnAllTeacherAdBean.returnObject;
      createList();
    }catch(e){
      return null;
    }
  }
}

import 'package:application_paper/model/TeacherApplication/TeacherApplicationCard.dart';
import 'package:application_paper/pojo/myApplicationPaper/teacherSelect/ReturnObject.dart';
import 'package:flutter/material.dart';

class TeacherApplicationList extends StatefulWidget {

  List<Map<String, dynamic>> listReturnObject;


  TeacherApplicationList({this.listReturnObject});

  @override
  _TeacherApplicationListState createState() => _TeacherApplicationListState(listReturnObject: this.listReturnObject);
}

class _TeacherApplicationListState extends State<TeacherApplicationList> {

  List<Map<String, dynamic>> listReturnObject;

  _TeacherApplicationListState({this.listReturnObject});

  Widget page;

  FloatingActionButton floatingActionButton;

  List<Widget> list;


  @override
  void initState() {
    list = new List<Widget>();
    _getList1();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: page,
      floatingActionButton: this.floatingActionButton,
    );
  }

  void _getList1() async {
    for (var item in listReturnObject) {
      ReturnObject returnObject = ReturnObject.fromJson(item);
      print(returnObject.toJson().toString());
      TeacherApplicationCard teacherApplicationCard = new TeacherApplicationCard(returnObject: returnObject,);
      this.list.add(teacherApplicationCard);
    }
    if(list.isEmpty) {
      page = this.noDataPage("构建序列失败");
    } else {
      page = hasData();
      // page = this.noDataPage("构建序列成功");
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

  Widget hasData() {
    return ListView(
      children: this.list,
    );
  }

  FloatingActionButton getFloatingActionButton() {
    return FloatingActionButton(
      child: Icon(Icons.autorenew),
      onPressed: () {
        setState(() {
          if (this.list.length != 0) {
            page = hasData();
            floatingActionButton = null;
          }
        });
      },
    );
  }
}

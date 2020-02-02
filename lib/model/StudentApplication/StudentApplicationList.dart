
import 'package:application_paper/model/StudentApplication/StudentApplicationCard.dart';
import 'package:application_paper/pojo/myApplicationPaper/ReturnObject.dart';
import 'package:flutter/material.dart';

class StudentApplicationList extends StatefulWidget {

  List<Map<String, dynamic>> returnObject;

  StudentApplicationList({this.returnObject});

  @override
  _StudentApplicationListState createState() => _StudentApplicationListState(returnObject: returnObject);
}

class _StudentApplicationListState extends State<StudentApplicationList> {

  List<Map<String, dynamic>> returnObject;

  _StudentApplicationListState({this.returnObject});

  Widget page;

  FloatingActionButton floatingActionButton;

  List<Widget> list;

  @override
  void initState() {
    _getList1();
    page = this.noDataPage("自在构建序列");
    print('--------:-------' + this.returnObject.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: page,
      floatingActionButton: this.floatingActionButton,
    );
  }

  void _getList1() async {
    for (var item in returnObject) {
      ReturnObject tempReturnObject = new ReturnObject(paperid: item['paperid']);
      StudentApplicationCard studentApplicationCard = new StudentApplicationCard(returnObject: tempReturnObject,);
      this.list.add(studentApplicationCard);
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
    return Container(
      child: ListView(
        padding: EdgeInsets.all(5),
        children: this.list,
      ),
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
import 'package:application_paper/model/SystemAD/ADListItem.dart';
import 'package:application_paper/pojo/system/SystemAD/ReturnAllSystemAdBean.dart';
import 'package:application_paper/pojo/system/SystemAD/ReturnObject.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class SystemApplication extends StatefulWidget {
  @override
  _SystemApplicationState createState() => _SystemApplicationState();
}

class _SystemApplicationState extends State<SystemApplication> {
  List<ReturnObject> list;

  List<SystemADListItem> listSystemADListItem;

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
      appBar: AppBar(title: Text('系统公告')),
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
        children: this.listSystemADListItem,
      ),
    );
  }


  void createList() {
    listSystemADListItem = new List();
    for (ReturnObject item in list) {
      SystemADListItem systemADListItem = new SystemADListItem(returnObject: item,);
      this.listSystemADListItem.add(systemADListItem);
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
          if (listSystemADListItem != null) {
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
        'http://123.56.167.84:8080/selection_of_college_graduation_design-0.0.1-SNAPSHOT/systemAnnouncement/getAll',
      );
      ReturnAllSystemAdBean returnAllSystemAdBean = ReturnAllSystemAdBean.fromJson(response.data);
      print(returnAllSystemAdBean);
      list = returnAllSystemAdBean.returnObject;
      createList();
    }catch(e){
      return null;
    }
  }
}

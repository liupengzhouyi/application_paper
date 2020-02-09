


import 'package:application_paper/pojo/teacher/ReturnApplicationPaperNotPassBean.dart';
import 'package:application_paper/pojo/teacher/ReturnApplicationPaperPassBean.dart';
import 'package:application_paper/pojo/teacher/ReturnPaperPassByIDBean.dart';
import 'package:application_paper/pojo/teacher/disposePaperApplicationTableBean.dart';
import 'package:application_paper/pojo/teacher/disposePaperTableBean.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DisposeApplicaton extends StatefulWidget {

  int id;

  int applicationID;

  DisposeApplicaton({this.id,this.applicationID});

  @override
  _DisposeApplicatonState createState() => _DisposeApplicatonState(id: id, applicationID: applicationID);
}

class _DisposeApplicatonState extends State<DisposeApplicaton> {

  int id;

  int applicationID;

  _DisposeApplicatonState({this.id, this.applicationID});

  Widget page;

  FloatingActionButton floatingActionButton;

  int key1 = 1;
  int key2 = 1;
  int key3 = 1;

  @override
  void initState() {
    this.page = this.selectDispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('处理申请'),
      ),
      body: this.page,
      floatingActionButton: this.floatingActionButton,
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

  Widget selectDispose() {
    return Center(
      child: Container(
        height: 400,
        width: 300,
        child: Row(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  height: 110,
                  width: 100,
                  child: Image.asset("assets/images/image05.png",fit: BoxFit.cover),
                ),
                SizedBox(height: 10,),
                Container(
                  child: Center(
                    child: SizedBox(
                      width: 60,
                      height: 40,
                      child: FlatButton(
                        //为什么要设置左右padding，因为如果不设置，那么会挤压文字空间
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        //文字颜色
                        textColor: Colors.black,
                        //按钮颜色
                        color: Colors.lightBlueAccent,
                        //画圆角
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        //如果使用FlatButton，必须初始化onPressed这个方法
                        onPressed: () {
                          setState(() {
                            print('同意');
                            this.page = this.noDataPage("正在处理");
                            this.floatingActionButton = this.getFloatingActionButton();
                            postHttp1();
                            postHttp2();
                          });
                        },
                        child: Text(
                          '通过',
                          style: TextStyle(fontSize: 14),
                        ),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                    )
                ),
                ),
              ],
            ),
            SizedBox(width: 80,),
            Column(
              children: <Widget>[
                Container(
                  height: 100,
                  width: 100,
                  child: Image.asset("assets/images/image06.png",fit: BoxFit.cover),
                ),
                SizedBox(height: 20,),
                Container(
                  child: Center(
                      child: SizedBox(
                        width: 60,
                        height: 40,
                        child: FlatButton(

                          //为什么要设置左右padding，因为如果不设置，那么会挤压文字空间
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          //文字颜色
                          textColor: Colors.black,
                          //按钮颜色
                          color: Colors.lightBlueAccent,
                          //画圆角
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            '拒绝',
                            style: TextStyle(fontSize: 14),
                          ),
                          //如果使用FlatButton，必须初始化onPressed这个方法
                          onPressed: () {
                            setState(() {
                              print('拒绝');
                              this.page = this.noDataPage("正在处理");
                              this.floatingActionButton = this.getFloatingActionButton();
                              postHttp3();
                            });
                          },
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                      )
                  ),
                ),
              ],
            ),
          ],
        )
      ),
    );
  }

  FloatingActionButton getFloatingActionButton() {
    return FloatingActionButton(
      child: Icon(Icons.autorenew),
      onPressed: () {
        setState(() {
          if (key3 == 2) {
            this.page = this.noDataPage("拒绝成功");
            this.floatingActionButton = getBack();
          } else if (key1 == 2 && key2 == 2) {
            this.page = this.noDataPage("通过成功");
            this.floatingActionButton = getBack();
          } else {
            this.page = this.noDataPage("正在处理");
          }
        });
      },
    );
  }

  FloatingActionButton getBack() {
    return FloatingActionButton(
      child: Icon(Icons.autorenew),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }

  // 处理论文表中的数据 已选
  void postHttp1() async {
    DisposePaperTableBean disposePaperTableBean = DisposePaperTableBean(integer: this.id);
    try{
      var response = await Dio().post(
        'http://123.56.167.84:8080/selection_of_college_graduation_design-0.0.1-SNAPSHOT/paper/passByID',
        data: disposePaperTableBean.toJson(),
      );
      ReturnPaperPassByIDBean returnPaperPassByIDBean = ReturnPaperPassByIDBean.fromJson(response.data);
      if (returnPaperPassByIDBean.key == true) {
        key1 = 2;
      }
    }catch(e){
      return null;
    }
  }

  // 处理论文申请表中的数据 同意 1
  void postHttp2() async {
    DisposePaperApplicationTableBean disposePaperApplicationTableBean =  DisposePaperApplicationTableBean(integer: this.applicationID);
    try{
      var response = await Dio().post(
        'http://123.56.167.84:8080/selection_of_college_graduation_design-0.0.1-SNAPSHOT/applicationPaper/passById',
        data: disposePaperApplicationTableBean.toJson(),
      );
      ReturnApplicationPaperPassBean returnApplicationPaperPassBean = ReturnApplicationPaperPassBean.fromJson(response.data);
      if (returnApplicationPaperPassBean.key == true) {
        key2 = 2;
      }
    }catch(e){
      return null;
    }
  }

  // 处理论文申请表中的数据 拒绝 -1
  void postHttp3() async {
    DisposePaperApplicationTableBean disposePaperApplicationTableBean =  DisposePaperApplicationTableBean(integer: this.applicationID);
    try{
      var response = await Dio().post(
        'http://123.56.167.84:8080/selection_of_college_graduation_design-0.0.1-SNAPSHOT/applicationPaper/norPassById',
        data: disposePaperApplicationTableBean.toJson(),
      );
      ReturnApplicationPaperNotPassBean returnApplicationPaperNotPassBean = ReturnApplicationPaperNotPassBean.fromJson(response.data);
      if (returnApplicationPaperNotPassBean.key == true) {
        key3 = 2;
      }
    }catch(e){
      return null;
    }
  }
}

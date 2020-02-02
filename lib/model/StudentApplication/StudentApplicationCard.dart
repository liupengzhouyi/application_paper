

import 'package:application_paper/pojo/myApplicationPaper/ReturnObject.dart';
import 'package:application_paper/pojo/myApplicationPaper/paper/GetPaperInformationBean.dart';
import 'package:application_paper/pojo/myApplicationPaper/paper/PaperIDBean.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class StudentApplicationCard extends StatefulWidget {

  // 论文信息
  GetPaperInformationBean getPaperInformationBean;
  // 申请信息
  ReturnObject returnObject;

  StudentApplicationCard({this.returnObject});

  @override
  _StudentApplicationCardState createState() => _StudentApplicationCardState(returnObject: this.returnObject);
}

class _StudentApplicationCardState extends State<StudentApplicationCard> {

  // 论文信息
  GetPaperInformationBean getPaperInformationBean;
  // 申请信息
  ReturnObject returnObject;

  _StudentApplicationCardState({this.returnObject});

  PaperIDBean paperIDBean;

  String isPass = "";
  Color color ;

  Widget crad;

  @override
  void initState() async {
    this.paperIDBean = await new PaperIDBean(integer: "${returnObject.paperid}");
    this.postHttp();
    if(returnObject.ispass.toString() == "1") {
      isPass = "通过申请";
      color = Colors.green;
    } else {
      isPass = "未通过申请";
      color = Colors.red;
    }
  }

  void createCrad() async {
    crad = await Card(
      color: Colors.lightBlueAccent,
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          SizedBox(height: 10.00,),
          Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Text(
                  '选题题目',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(width: 4.50,),
              Expanded(
                flex: 2,
                child: Text(
                  '${this.getPaperInformationBean.returnObject.papername}',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black
                  ),
                ),

              ),
            ],
          ),
          SizedBox(height: 4.50,),
          Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Text(
                  '是否通过',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black
                  ),),
              ),
              SizedBox(width: 4.50,),
              Expanded(
                flex: 2,
                child: Text(
                  '${this.isPass}',
                  style: TextStyle(
                    fontSize: 20,
                    color: color,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 4.50,),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    this.createCrad();
    return crad;
  }

  void postHttp() async {
    try{
      var response = await Dio().post(
        'http://123.56.167.84:8080/selection_of_college_graduation_design-0.0.1-SNAPSHOT/paper/selectByID',
        data: this.paperIDBean.toJson(),
      );
      getPaperInformationBean = GetPaperInformationBean.fromJson(response.data);
      print(response);
    }catch(e){
      getPaperInformationBean = null;
    }
  }

}



import 'package:application_paper/model/StudentApplication/applicationing.dart';
import 'package:application_paper/model/topicCard.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class NotApplication extends StatefulWidget {

  String id = "";

  NotApplication({this.id});

  @override
  _NotApplicationState createState() => _NotApplicationState(id: this.id);
}

class _NotApplicationState extends State<NotApplication> {

  String id = "";

  _NotApplicationState({this.id});

  Widget page;

  var Data;

  FloatingActionButton floatingActionButton;

  @override
  void initState() {

  }

  @override
  Widget build(BuildContext context) {
    if (Data == null) {
      page = Scaffold(
        body: Center(
          child: Container(
            child: Text('暂无数据'),
          ),
        ),
        floatingActionButton:FloatingActionButton(
          child: Icon(Icons.autorenew),
          onPressed: () {
            if (Data == null) {
              print('null');
            } else {
              setState(() {
                page = hasData(context);
              });
              print('has Data');
            }
          },
        ),
      );
    }
    postHttp();
    return MaterialApp(
      title: '题目详细信息',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: page,
    );
  }

  void postHttp() async {
    try{
      var response = await Dio().post(
        'http://123.56.167.84:8080/selection_of_college_graduation_design-0.0.1-SNAPSHOT/paper/selectByID',
        data: {"integer": this.id}
      );
      print(response.data['whatYourDo']);
      Data = response.data['returnObject'];
      print(Data);
    }catch(e){
      return null;
    }
  }

  Widget hasData(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                height: 400.00,
                child: TopicCrad(
                  id: Data['id'].toString(),
                  papername: Data['papername'],
                  teacherid: Data['teacherid'],
                  releasedate: Data['releasedate'].toString(),
                  isselect: Data['isselect'].toString(),
                  url: Data['url'],
                ),
              ),
              SizedBox(height: 10.00,),
              RaisedButton(
                child: Text("申请"),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => StudentApplicationPaper(paperID: this.id,)
                      )
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.reply),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }

}
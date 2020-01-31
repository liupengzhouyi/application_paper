

import 'package:application_paper/topic/ApplicationController.dart';
import 'package:flutter/material.dart';

class TopicCrad extends StatefulWidget {

  String id = "";
  String papername = "";
  String teacherid = "";
  String releasedate = "";
  String url = "";
  String isselect = "";

  TopicCrad({this.id, this.papername, this.teacherid, this.releasedate, this.url,
    this.isselect});

  @override
  _TopicCradState createState() => _TopicCradState(
      id: this.id,
      papername: this.papername,
      teacherid: this.teacherid,
      releasedate: this.releasedate,
      url: this.url,
      isselect: this.isselect,
  );
}

class _TopicCradState extends State<TopicCrad> {

  String id = "";
  String papername = "";
  String teacherid = "";
  String releasedate = "";
  String url = "";
  String isselect = "";

  String isisselectStringType;
  Color selectColor;

  _TopicCradState({this.id, this.papername, this.teacherid, this.releasedate,
    this.url, this.isselect});

  @override
  Widget build(BuildContext context) {
    if (this.isselect == "1") {
      isisselectStringType = "已选择";
      selectColor = Colors.red;
    } else {
      isisselectStringType = "未选择";
      selectColor = Colors.green;
    }
    return Card(
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
                    color: Colors.lightGreen
                  ),
                ),
              ),
              SizedBox(width: 4.50,),
              Expanded(
                flex: 2,
                child: Text(
                  '${this.papername}',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.lightGreen
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
                  '教师ID',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue
                  ),),
              ),
              SizedBox(width: 4.50,),
              Expanded(
                flex: 2,
                child: Text(
                  '${this.teacherid}',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue
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
                  '是否被选',
                  style: TextStyle(fontSize: 20.00),
                ),
              ),
              SizedBox(width: 4.50,),
              Expanded(
                flex: 2,
                child: Text(
                  '${this.isisselectStringType}',
                  style: TextStyle(
                    color: selectColor,
                    fontSize: 20.00,
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
                child: Text('发布日期'),
              ),
              SizedBox(width: 4.50,),
              Expanded(
                flex: 2,
                child: Text('${this.releasedate}'),
              ),
            ],
          ),
          SizedBox(height: 4.50,),
          Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Text('文件下载地址'),
              ),
              SizedBox(width: 4.50,),
              Expanded(
                flex: 2,
                child: Text('${this.url}'),
              ),
            ],
          ),
          SizedBox(height: 10.00,),
          /*RaisedButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ApplicationController(hasApplication: this.isselect, id: this.id,),
                  )
              );
            },
            color: Colors.red[300],
            child: new Text(
              "详情",
              style: new TextStyle(color: Colors.white),
            ),
          ),*/
        ],
      ),
    );
  }
}

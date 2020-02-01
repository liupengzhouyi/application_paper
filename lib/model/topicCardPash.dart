

import 'package:application_paper/model/topicCard.dart';
import 'package:application_paper/topic/ApplicationController.dart';
import 'package:flutter/material.dart';

class TopicCradPash extends StatefulWidget {

  TopicCrad topicCrad;


  TopicCradPash({this.topicCrad});

  @override
  _TopicCradState createState() => _TopicCradState(
    topicCrad: this.topicCrad
  );
}

class _TopicCradState extends State<TopicCradPash> {

  TopicCrad topicCrad;

  _TopicCradState({this.topicCrad});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey,
      child: Column(
        children: <Widget>[
          this.topicCrad,
          Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Text(
                  '详细信息',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.lightGreen
                  ),
                ),
              ),
              SizedBox(width: 4.50,),
              Expanded(
                flex: 2,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ApplicationController(hasApplication: this.topicCrad.isselect, id: this.topicCrad.id,),
                        )
                    );
                  },
                  color: Colors.red[300],
                  child: new Text(
                    "详情",
                    style: new TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

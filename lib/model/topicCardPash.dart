

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
    return  Column(
      children: <Widget>[
        this.topicCrad,
        RaisedButton(
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
      ],
    );
  }
}

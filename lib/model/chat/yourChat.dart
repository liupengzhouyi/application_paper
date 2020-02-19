import 'package:application_paper/pojo/chat/ReturnObject.dart';
import 'package:flutter/material.dart';
import 'package:smart_bubble/smart_bubble_widget.dart';

class YourChat extends StatefulWidget {

  ReturnObject returnObject;

  YourChat({this.returnObject});

  /*{
  "id": 15,
  "bodyID": "1667159125",
  "name": "刘鹏",
  "data": "2020-02-18",
  "timee": "17:12:02",
  "chat": "112345678",
  "idtype": 1
  }*/

  @override
  _YourChatState createState() => _YourChatState(returnObject: this.returnObject);
}

class _YourChatState extends State<YourChat> {

  ReturnObject returnObject;

  _YourChatState({this.returnObject});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 2, top: 2),
          //设置 child 居中
          alignment: Alignment(0, 0),
          height: 40,
          width: 40,
          //边框设置
          decoration: new BoxDecoration(
            //背景
            color: Colors.lightBlueAccent,
            //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
            //设置四周边框
            border: new Border.all(width: 1, color: Colors.red),
          ),
          child: Icon(Icons.account_circle),
        ),
        SmartBubble(
          title: Text("${this.returnObject.data}" + " - " + "${this.returnObject.timee}"),
          arrowDirection: ArrowDirection.left,
          maxWidth: 230,
          child: Text("${this.returnObject.chat}",style: TextStyle(color: Colors.white, fontSize: 20)),
        ),
      ],
    );
  }
}


import 'package:application_paper/pojo/chat/ReturnObject.dart';
import 'package:flutter/material.dart';
import 'package:smart_bubble/smart_bubble_widget.dart';

class MyChat extends StatefulWidget {

  ReturnObject returnObject;

  MyChat({this.returnObject});

  @override
  _MyChatState createState() => _MyChatState(returnObject: this.returnObject);
}

class _MyChatState extends State<MyChat> {

  ReturnObject returnObject;

  _MyChatState({this.returnObject});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        SmartBubble(
          // icon: Icon(Icons.print),
          title: Text("${this.returnObject.data}" + " - " + "${this.returnObject.timee}"),
          child: Text("${this.returnObject.chat}",style: TextStyle(color: Colors.white, fontSize: 20)),
        ),
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
        SizedBox(width: 5,),
      ],
    );
  }
}


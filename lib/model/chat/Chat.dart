import 'package:application_paper/model/chat/myChat.dart';
import 'package:application_paper/model/chat/yourChat.dart';
import 'package:application_paper/pojo/chat/ReturnObject.dart';
import 'package:flutter/material.dart';

class ChatLp extends StatefulWidget {

  ReturnObject returnObject;

  int keylp;

  ChatLp({this.returnObject, this.keylp});

  @override
  _ChatLpState createState() => _ChatLpState(returnObject: this.returnObject, keylp: this.keylp);
}

class _ChatLpState extends State<ChatLp> {

  ReturnObject returnObject;

  int keylp;

  _ChatLpState({this.returnObject, this.keylp});

  @override
  Widget build(BuildContext context) {
    if (this.keylp == 1) {
      return YourChat(returnObject: this.returnObject,);
    } else {
      return MyChat(returnObject: this.returnObject,);
    }
  }
}

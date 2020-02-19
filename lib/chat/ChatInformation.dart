import 'package:application_paper/model/chat/Chat.dart';
import 'package:application_paper/model/chat/myChat.dart';
import 'package:application_paper/model/chat/yourChat.dart';
import 'package:application_paper/pojo/chat/ChatBean.dart';
import 'package:application_paper/pojo/chat/GroupBean.dart';
import 'package:application_paper/pojo/chat/ReturnChatBean.dart';
import 'package:application_paper/pojo/chat/ReturnObject.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class GetChatInformation extends StatefulWidget {

  int groupID;

  int idtype;

  String bodyID;

  String groupName;

  GetChatInformation({this.groupID, this.bodyID, this.groupName, this.idtype});

  @override
  _GetChatInformationState createState() => _GetChatInformationState(groupID: this.groupID, bodyID: this.bodyID, groupName: this.groupName, idtype: this.idtype);
}

class _GetChatInformationState extends State<GetChatInformation> {

  int groupID;

  int idtype;

  String bodyID;

  String groupName;

  _GetChatInformationState({this.groupID, this.bodyID, this.groupName, this.idtype}) {
    this.groupBean = GroupBean(integer: this.groupID);
  }

  Widget page;

  FloatingActionButton floatingActionButton;

  GroupBean groupBean;

  ReturnChatBean returnChatBean;

  List<ChatLp> list;

  @override
  void initState() {
    this.page = this.noDataPage("");
    this.postHttp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${this.groupName}'),),
      body: page,
      floatingActionButton: this.floatingActionButton,
    );
  }

  postHttp() async {
    try{
      var response = await Dio().post(
        'http://123.56.167.84:8080/selection_of_college_graduation_design-0.0.1-SNAPSHOT/groupChat/getGroupInformationII',
        data: this.groupBean.toJson(),
      );
      print(response.data);
      returnChatBean = ReturnChatBean.fromJson(response.data);
      if (returnChatBean.key == false) {
        setState(() {
          page = this.noDataPage('没有聊天数据');
          // 必须改
        });
      } else {
        List<ReturnObject> chatList = returnChatBean.returnObject;
        if(chatList.length == 0) {
          page = this.noDataPage('没有聊天数据');
          // 必须改
        } else {
          list = new List<ChatLp>();
          ChatLp chatLp;
          for (ReturnObject returnObject in chatList) {
            if (returnObject.bodyID == this.bodyID) {
              // 自己发言
              chatLp = new ChatLp(returnObject: returnObject, keylp: 0,);
            } else {
              // 别人发言
              print('别人发言');
              chatLp = new ChatLp(returnObject: returnObject, keylp: 1,);
            }
            list.add(chatLp);
          }
          setState(() {
            this.page = Column(
              children: <Widget>[
                new Flexible(                     //子控件可柔性填充，如果下方弹出输入框，使消息记录列表可适当缩小高度
                  child: ListView(children: this.list,),
                ),
                new Divider(height: 1.0),      //聊天记录和输入框之间的分隔
                new Container(
                  decoration: new BoxDecoration(color: Theme.of(context).cardColor),
                  child: _buildTextComposer(),        //页面下方的文本输入控件
                ),
              ],
            );
          });
        }
      }

    }catch(e){
      return null;
    }
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


  final TextEditingController _textController = new TextEditingController();    //聊天窗口的文本输入控件

  //定义发送文本事件的处理函数
  void _handleSubmitted(String text) async {
    ChatBean chatBean = new ChatBean(bodyid: this.bodyID, chat: text, groupid: this.groupID, idtype: this.idtype);
    _textController.clear();        //清空输入框
    // 发送消息
    try{
      var response = await Dio().post(
        'http://123.56.167.84:8080/selection_of_college_graduation_design-0.0.1-SNAPSHOT/groupChat/add',
        data:chatBean.toJson(),
      );
      print(response.data['whatYourDo']);
      print(response.data['returnObject']);
    }catch(e){
      return null;
    }
    //状态变更，向聊天记录中插入新记录
    setState(() {
      this.postHttp(); //插入新的消息记录
    });
  }


  //定义文本输入框控件
  Widget _buildTextComposer() {
    return new Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: new Row(                    //文本输入和发送按钮都在同一行，使用Row控件包裹实现
            children: <Widget>[
              new Flexible(
                child: new TextField(
                  controller: _textController,              //载入文本输入控件
                  onSubmitted: _handleSubmitted,
                  decoration: new InputDecoration.collapsed(hintText: "Send a message"),      //输入框中默认提示文字
                ),
              ),
              new Container(
                margin: new EdgeInsets.symmetric(horizontal: 4.0),
                child: new IconButton(            //发送按钮
                    icon: new Icon(Icons.send),//发送按钮图标
                    onPressed: () =>  _handleSubmitted(_textController.text),      //触发发送消息事件执行的函数_handleSubmitted
                ),
              ),
            ],
        )
    );
  }
}

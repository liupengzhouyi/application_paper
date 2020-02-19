import 'package:application_paper/pojo/chat/GroupBean.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() => runApp(Lll());

class Lll extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GetChatInformation(groupID: 1, bodyID: '1667159125', groupName: '13',),
    );
  }
}


class GetChatInformation extends StatefulWidget {

  int groupID;

  String bodyID;

  String groupName;

  GetChatInformation({this.groupID, this.bodyID, this.groupName});

  @override
  _GetChatInformationState createState() => _GetChatInformationState(groupID: this.groupID, bodyID: this.bodyID, groupName: this.groupName);
}

class _GetChatInformationState extends State<GetChatInformation> {

  int groupID;

  String bodyID;

  String groupName;

  _GetChatInformationState({this.groupID, this.bodyID, this.groupName}) {
    this.groupBean = GroupBean(integer: this.groupID);
  }

  Widget page;

  FloatingActionButton floatingActionButton;

  GroupBean groupBean;

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
}

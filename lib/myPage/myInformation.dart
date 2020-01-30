

import 'package:application_paper/myPage/personalInformation.dart';
import 'package:flutter/material.dart';

class MyInformation extends StatefulWidget {

  @override
  _MyInformationState createState() => _MyInformationState();
}

class _MyInformationState extends State<MyInformation> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('我的信息'),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Container(
                height: 50.00,
                child: ListTile(
                  leading:Icon(Icons.account_circle),
                  title: Text("个人信息", style: TextStyle(fontSize: 35, color:Colors.black),),
                  trailing: Icon(Icons.navigate_next),
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => PersonalInformation(name: '刘鹏', number: '1667159125', phoneNumber: '14747219744',)
                        )
                    );
                  },
                ),
              ),

              Container(
                height: 50.00,
                child: ListTile(
                  leading:Icon(Icons.local_post_office),
                  title: Text("选题信息", style: TextStyle(fontSize: 35, color:Colors.black),),
                  trailing: Icon(Icons.navigate_next),
                  /*onTap: () {
                    //处理点击事件
                  },*/
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

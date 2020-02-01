

import 'package:application_paper/myPage/myApplication.dart';
import 'package:application_paper/myPage/systemApplication.dart';
import 'package:application_paper/myPage/topicInformation.dart';
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
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => TopicInformation(title: '高校选题APP',teacher: '兰孝文',date: '2020',)
                        ),
                    );
                  },
                ),
              ),

              Container(
                height: 50.00,
                child: ListTile(
                  leading:Icon(Icons.announcement),
                  title: Text("教师公告", style: TextStyle(fontSize: 35, color:Colors.black),),
                  trailing: Icon(Icons.navigate_next),
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => TeacherApplication()
                        )
                    );
                  },
                ),
              ),

              Container(
                height: 50.00,
                child: ListTile(
                  leading:Icon(Icons.settings_applications),
                  title: Text("系统公告", style: TextStyle(fontSize: 35, color:Colors.black),),
                  trailing: Icon(Icons.navigate_next),
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => SystemApplication()
                        )
                    );
                  },
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

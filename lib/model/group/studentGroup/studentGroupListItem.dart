

import 'package:application_paper/pojo/student/studentGetGroup/ReturnObject.dart';
import 'package:flutter/material.dart';

class StudentGroupListItem extends StatefulWidget {

  ReturnObject returnObject;

  String studentID;

  StudentGroupListItem({this.returnObject, this.studentID});

  @override
  _StudentGroupListItemState createState() => _StudentGroupListItemState(returnObject: this.returnObject, studentID: this.studentID);
}

class _StudentGroupListItemState extends State<StudentGroupListItem> {

  ReturnObject returnObject;

  String studentID;

  /*{
  "groupID": 1,
  "name": "刘鹏",
  "groupName": "汉芯打磨团队",
  "teacherID": "2020001"
  },*/

  _StudentGroupListItemState({this.returnObject, this.studentID});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage('https://ae01.alicdn.com/kf/Uc5a32bfb96ae41a4ab2f54bf1eb94abeL.jpg'),
      ),
      title: Text('${returnObject.groupName}', style: TextStyle(fontSize: 30), overflow: TextOverflow.ellipsis,),
      trailing: Icon(Icons.navigate_next, color: Colors.red,),
      onTap: () {
        // 小组ID
        // 我的编号
        // 小组名称
      },
    );
  }

}


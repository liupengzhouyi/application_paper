

import 'package:application_paper/pojo/student/studentGetGroup/ReturnObject.dart';
import 'package:flutter/material.dart';

class StudentGroupListItem extends StatefulWidget {

  ReturnObject returnObject;

  StudentGroupListItem({this.returnObject});

  @override
  _StudentGroupListItemState createState() => _StudentGroupListItemState(returnObject: this.returnObject);
}

class _StudentGroupListItemState extends State<StudentGroupListItem> {

  ReturnObject returnObject;

  /*{
  "groupID": 1,
  "name": "刘鹏",
  "groupName": "汉芯打磨团队",
  "teacherID": "2020001"
  },*/

  _StudentGroupListItemState({this.returnObject});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage('https://ae01.alicdn.com/kf/Uc5a32bfb96ae41a4ab2f54bf1eb94abeL.jpg'),
      ),
      title: Text('${returnObject.groupName}', style: TextStyle(fontSize: 30), overflow: TextOverflow.ellipsis,),
      trailing: Icon(Icons.navigate_next, color: Colors.red,),
    );
  }

}


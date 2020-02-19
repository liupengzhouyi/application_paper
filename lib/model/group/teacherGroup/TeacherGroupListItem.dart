import 'package:application_paper/pojo/teacher/teacherGetGroup/ReturnObject.dart';
import 'package:flutter/material.dart';

class TeacherGroupListItem extends StatefulWidget {

  ReturnObject returnObject;

  TeacherGroupListItem({this.returnObject});

  @override
  _TeacherGroupListItemState createState() => _TeacherGroupListItemState(returnObject: this.returnObject);
}

class _TeacherGroupListItemState extends State<TeacherGroupListItem> {

  ReturnObject returnObject;

  _TeacherGroupListItemState({this.returnObject});

  /*
  int id;
  String groupname;
  String teacherid;
  */

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage('https://ae01.alicdn.com/kf/Uc5a32bfb96ae41a4ab2f54bf1eb94abeL.jpg'),
      ),
      title: Text('${returnObject.groupname}', style: TextStyle(fontSize: 30), overflow: TextOverflow.ellipsis,),
      trailing: Icon(Icons.navigate_next, color: Colors.red,),
    );
  }
}

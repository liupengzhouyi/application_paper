import 'package:application_paper/pojo/teacher/TeacherAd/ReturnObject.dart';
import 'package:flutter/material.dart';

class TeacherADListItem extends StatefulWidget {

  ReturnObject returnObject;

  TeacherADListItem({this.returnObject});

  @override
  _TeacherADListItemState createState() => _TeacherADListItemState(returnObject: this.returnObject);
}

class _TeacherADListItemState extends State<TeacherADListItem> {

  ReturnObject returnObject;

  _TeacherADListItemState({this.returnObject});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.album, color:Colors.lightBlueAccent,),
            title: Text('${returnObject.title}', style: TextStyle(fontSize: 30), overflow: TextOverflow.ellipsis,),
            subtitle: Text('${getTime(returnObject.datetime)}', style: TextStyle(fontSize: 20), overflow: TextOverflow.ellipsis,),
            trailing: Icon(Icons.navigate_next),
          ),
        ],
      ),
    );
  }

  String getTime(String time) {
    String t = '';
    for(int i=0;i<10;i++) {
      t = t + time[i];
    }
    return t;
  }

}

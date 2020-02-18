import 'package:application_paper/pojo/system/SystemAD/ReturnObject.dart';
import 'package:flutter/material.dart';

class SystemADListItem extends StatefulWidget {

  ReturnObject returnObject;

  SystemADListItem({this.returnObject});

  @override
  _SystemADListItemState createState() => _SystemADListItemState(returnObject: this.returnObject);
}

class _SystemADListItemState extends State<SystemADListItem> {

  ReturnObject returnObject;

  _SystemADListItemState({this.returnObject});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.album, color:Colors.limeAccent, ),
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

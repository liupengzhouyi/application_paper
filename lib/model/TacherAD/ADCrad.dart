import 'package:flutter/material.dart';

// 这里为入口函数
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(title: Text('text'),),
        body: TeacherADCard(),
      ),     // 指定去加载 Index页面。
    );
  }
}


class TeacherADCard extends StatefulWidget {
  @override
  _TeacherADCardState createState() => _TeacherADCardState();
}

class _TeacherADCardState extends State<TeacherADCard> {

  var returnObject = {
    'id': 1,
    'authorid': "6969001",
    'datetime': "2020-01-16T00:00:00.000+0000",
    'title': "第一次系统公告",
    'content': "第一次系统公告"
  };

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.album, color:Colors.lightBlueAccent,),
              title: Text('${returnObject['title']}', style: TextStyle(fontSize: 30), overflow: TextOverflow.ellipsis,),
              subtitle: Text('${getTime(returnObject['datetime'])}', style: TextStyle(fontSize: 20), overflow: TextOverflow.ellipsis,),
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

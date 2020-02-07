
import 'package:application_paper/pojo/myApplicationPaper/paper/PaperIDBean.dart';
import 'package:application_paper/pojo/myApplicationPaper/studentSelect/ReturnObject.dart';
import 'package:flutter/material.dart';

void main() => runApp(Test());

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('tfvy'),
        ),
        body: StudentApplicationCard(
          returnObject: ReturnObject(
              isPass: 1,
              paperID: 1,
              paperName: "《123....................》",
              teacherID: "2020001",
              teachername: "yvgub"
          ),
        ),
      ),
    );
  }
}


class StudentApplicationCard extends StatefulWidget {

  // 申请信息
  ReturnObject returnObject;

  StudentApplicationCard({this.returnObject});

  @override
  _StudentApplicationCardState createState() => _StudentApplicationCardState(returnObject: this.returnObject);
}

class _StudentApplicationCardState extends State<StudentApplicationCard> {

  // 申请信息
  ReturnObject returnObject;

  _StudentApplicationCardState({this.returnObject});

  PaperIDBean paperIDBean;

  String isPass = "";

  Color color ;

  Widget crad;

  @override
  void initState() {
    if(returnObject.isPass.toString() == "1") {
      isPass = "通过申请";
      color = Colors.green;
    } else {
      isPass = "未通过申请";
      color = Colors.red;
    }
    this.createCrad();
  }

  void createCrad() {
    crad = new Card(
      color: Colors.white70,
      margin: EdgeInsets.all(10),
      child: Container(
        height: 150,
        child: Column(
          children: <Widget>[
            SizedBox(height: 10.00,),
            myMode("选题题目", Colors.black87, '${this.returnObject.paperName}', Colors.black, 30),
            SizedBox(height: 4.50,),
            myMode("是否通过", Colors.black, '${this.isPass}', color, 30),
            SizedBox(height: 4.50,),
            myMode("导师姓名", Colors.black, '${this.returnObject.teachername}', Colors.black, 30),
          ],
        ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: crad,
    );
  }

  Widget myMode(String t1, Color color1, String t2, Color color2, double size) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Text(
            " " + t1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: size,
              color: color1,
            ),
          ),
        ),
        SizedBox(width: 4.50,),
        Expanded(
          flex: 2,
          child: Text(
            t2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontSize: size,
                color: color2
            ),
          ),
        ),
      ],
    );
  }
}

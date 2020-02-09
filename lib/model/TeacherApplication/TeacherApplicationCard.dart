
import 'package:application_paper/model/TeacherApplication/DisposeApplication.dart';
import 'package:application_paper/pojo/myApplicationPaper/teacherSelect/ReturnObject.dart';
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
        body: TeacherApplicationCard(
          returnObject: ReturnObject(
              isPass: 0,
              paperID: 1,
              paperName: "《123....................》",
              studentNumber: "2020001",
              studentName: "yvgub"
          ),
        ),
      ),
    );
  }
}


class TeacherApplicationCard extends StatefulWidget {

  // 申请信息
  ReturnObject returnObject;

  TeacherApplicationCard({this.returnObject});

  @override
  _TeacherApplicationCardState createState() => _TeacherApplicationCardState(returnObject: this.returnObject);
}

class _TeacherApplicationCardState extends State<TeacherApplicationCard> {

  // 申请信息
  ReturnObject returnObject;

  _TeacherApplicationCardState({this.returnObject});

  String isPass = "";

  Color color;

  Widget card;

  double height;

  @override
  void initState() {
    if(returnObject.isPass.toString() == "1") {
      isPass = "通过申请";
      color = Colors.green;
      height = 160.00;
     } else if(returnObject.isPass.toString() == "-1") {
      isPass = "未通过申请";
      color = Colors.red;
      height = 160.00;
    } else if(returnObject.isPass.toString() == "0") {
      isPass = "未处理申请";
      color = Colors.blue;
      height = 210.00;
    }
    this.createCrad();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: this.card,
    );
  }

  Widget getLink() {
    if (this.returnObject.isPass.toString() != "0") {
      return SizedBox(width: 0,);
    } else {
      return Container(
        child: Center(
          child: SizedBox(
            width: 160,
            height: 40,
            child: FlatButton(
              //为什么要设置左右padding，因为如果不设置，那么会挤压文字空间
              padding: EdgeInsets.symmetric(horizontal: 8),
              //文字颜色
              textColor: Colors.black,
              //按钮颜色
              color: Colors.lightBlueAccent,
              //画圆角
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              //如果使用FlatButton，必须初始化onPressed这个方法
              onPressed: () {
                // print('处理申请');
                Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => DisposeApplicaton()
                    )
                );
              },
              child: Text(
                '处理申请',
                style: TextStyle(fontSize: 14),
              ),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          )
        ),
      );
    }
  }

  void createCrad() {
    card = new Card(
        color: Colors.white70,
        margin: EdgeInsets.all(10),
        child: Container(
          height: height,
          child: Column(
            children: <Widget>[
              SizedBox(height: 10.00,),
              myMode("选题题目", Colors.black87, '${this.returnObject.paperName}', Colors.black, 25),
              SizedBox(height: 4.50,),
              myMode("选题状态", Colors.black, '${this.isPass}', color, 25),
              SizedBox(height: 4.50,),
              myMode("学生学号", Colors.black, '${this.returnObject.studentNumber}', Colors.black, 25),
              SizedBox(height: 4.50,),
              myMode("学生姓名", Colors.black, '${this.returnObject.studentName}', Colors.black, 25),
              SizedBox(height: 4.50,),
              getLink(),
            ],
          ),
        )
    );
  }

  Widget myMode(String t1, Color color1, String t2, Color color2, double size) {
    return Row(
      children: <Widget>[
        SizedBox(width: 12,),
        Expanded(
          flex: 1,
          child: Text(
            " " + t1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: size,
              color: color1,
              backgroundColor: Colors.lime,
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
                color: color2,
                // backgroundColor: Colors.greenAccent,
            ),
          ),
        ),
      ],
    );
  }
}

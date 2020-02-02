
import 'package:application_paper/landing/managerLanding.dart';
import 'package:application_paper/landing/studentLanding.dart';
import 'package:application_paper/landing/teacherLanding.dart';
import 'package:flutter/material.dart';

void main() => runApp(LandController());

class LandController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LandingController(),
    );
  }
}

class LandingController extends StatefulWidget {
  @override
  _LandingControllerState createState() => _LandingControllerState();
}

class _LandingControllerState extends State<LandingController> {

  FloatingActionButton floatingActionButton;

  List<Widget> listWidgets;

  @override
  void initState() {
    /*listWidgets.add(TeacherLand());
    listWidgets.add(StudentLand());
    listWidgets.add(ManagerLand());*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登陆身份选择'),
        backgroundColor: Colors.greenAccent,
      ),
      body: Container(
          child: Column(
            children: <Widget>[
              SizedBox(height: 157.00,),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(width: 10.00,),
                  addMode(context, StudentLanding(), "学生登陆", Image.asset("assets/images/image02.png",fit: BoxFit.fill,)),
                  SizedBox(width: 10.00,),
                  addMode(context, TeacherLanding(), "教师登陆",Image.asset("assets/images/image03.png",fit: BoxFit.fill,)),
                  SizedBox(width: 10.00,),
                  addMode(context, ManagerLanding(), "管理员登陆", Image.asset("assets/images/image04.png",fit: BoxFit.fill,)),
                  SizedBox(width: 10.00,),
                ],
              ),
            ],
          ),
        ),
      floatingActionButton: floatingActionButton,
    );
  }

  FloatingActionButton getFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () {
        Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => StudentLand(),
            )
        );
      },
      tooltip: 'Increment',
      child: Icon(Icons.navigate_next),
    );
  }

  Widget addMode(BuildContext context, Widget tempWidget, String name, Image image) {
    return Expanded(
        flex: 1,
        child: Column(
          children: <Widget>[
            Container(
              height: 100,
              width: 100,
              child: image,
            ),
            SizedBox(width: 10.00,),
            MaterialButton(
              child: new Text(name, style: new TextStyle(color: Colors.black),),
              color: Colors.lime,
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => tempWidget,
                    )
                );
              },
            ),
          ],
        )
    );
  }
}


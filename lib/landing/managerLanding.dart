
import 'dart:convert';
import 'dart:io';

import 'package:application_paper/fristPage/mainPage.dart';
import 'package:application_paper/landing/managerCheckLanding.dart';
import 'package:application_paper/pojo/landing/ManagerLanding/ManagerLandingBean.dart';
import 'package:application_paper/pojo/userInformation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() => runApp(ManagerLand());

class ManagerLand extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ManagerLanding(),
    );
  }
}

class ManagerLanding extends StatefulWidget {

  ManagerLanding({Key key}):super(key:key);

  @override
  _LandingState createState() => _LandingState();

}

class _LandingState extends State<ManagerLanding> {

  //定义一个controller
  TextEditingController _uNameController = TextEditingController();

  //定义一个controller
  TextEditingController _uPassController = TextEditingController();

  String _name = "";

  String _pass = "";

  ManagerCheckLanding managerCheckLanding = null;

  ManagersLandingBean managersLandingBean;

  Widget page;

  FloatingActionButton floatingActionButton;

  @override
  void initState() {
    page = this.inputInformation();
    floatingActionButton = this.getFloatingActionButton();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("管理员登陆"),
      ),
      body: page,
      floatingActionButton: floatingActionButton,
    );
  }

  void _incrementCounter() async {
    if (managerCheckLanding == null) {
      setState(() {
        this._name = this._uNameController.text;
        this._pass = this._uPassController.text;
        managersLandingBean = new ManagersLandingBean(managerid: this._name, passwordvalue: this._pass);
        managerCheckLanding = new ManagerCheckLanding(managersLandingBean: managersLandingBean);
      });
    } else {
      if (managerCheckLanding.returnManagerLandingBean == null) {
        setState(() {
          page = noDataPage("正在校验登陆");
          floatingActionButton = FloatingActionButton(
            onPressed: () {},
            tooltip: 'Increment',
            child: Icon(Icons.autorenew),
          );
        });
      } else {
        if (managerCheckLanding.returnManagerLandingBean.key == true) {
          setState(() {
            page = noDataPage("登陆成功");
            UserInformation userInformation = new UserInformation(userType: "3", id: managersLandingBean.managerid, password: managersLandingBean.managerid, landing: "1", registered: "1");
            //清空原有数据
            clearContent();
            // 保存新的登陆信息
            saveValue(userInformation);
            floatingActionButton = FloatingActionButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MyMainApp(),
                    )
                );
              },
              tooltip: 'Increment',
              child: Icon(Icons.exit_to_app),
            );
          });
        } else {
          setState(() {
            page = noDataPage("登陆失败");
            floatingActionButton = FloatingActionButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ManagerLand(),
                    )
                );
              },
              tooltip: 'Increment',
              child: Icon(Icons.exit_to_app),
            );
          });
        }
      }
    }
  }

  Widget inputInformation() {
    return Center(
      child:Container(
        width: 250.00,
        child: Column(
          children: <Widget>[
            Container(
              child: TextField(
                autofocus: true,
                controller: _uNameController,
                decoration: InputDecoration(
                  labelText: "管理员编号",
                  hintText: "管理员编号",
                  prefixIcon: Icon(Icons.person),
                ),
              ),
            ),
            Container(
              width: 250.00,
              child: TextField(
                controller: _uPassController,
                decoration: InputDecoration(
                  labelText: "密码",
                  hintText: "您的登录密码",
                  prefixIcon: Icon(Icons.lock),
                ),
                obscureText: true,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget noDataPage(String string) {
    return Center(
      child: Container(
        width: 360.00,
        height: 500.00,
        child: Center(
          child: Container(
            child: Column(
              children: <Widget>[
                Image.asset("assets/images/1470137290773494.gif",fit: BoxFit.cover,),
                SizedBox(height: 50,),
                Text(string,
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.redAccent,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  FloatingActionButton getFloatingActionButton() {
    return FloatingActionButton(
      onPressed: _incrementCounter,
      tooltip: 'Increment',
      child: Icon(Icons.file_upload),
    );
  }

  // _getLocalFile函数，获取本地文件目录
  Future<File> _getLocalFile() async {
    // 获取本地文档目录
    String dir = (await getApplicationDocumentsDirectory()).path;
    print(dir);
    // 返回本地文件目录
    return new File('$dir/userInformation.txt');
  }


  // 保存登陆数据
  void saveValue(UserInformation userInformation) async {
    try {
      File f = await _getLocalFile();
      IOSink slink = f.openWrite(mode: FileMode.append);
      slink.write('${userInformation.toString()}');
      slink.close();
    } catch (e) {
      // 写入错误
      print(e);
    }
  }

  // 清空本地保存的文件
  void clearContent() async {
    File f = await _getLocalFile();
    await f.writeAsString('');
  }

}

import 'package:application_paper/model/topicCard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp111());
}

class MyApp111 extends StatelessWidget{

  List<Widget> _getList1() {
    List listData = [
      {
        "id": 1,
        "papername": "《高校毕业设计选题系统》",
        "teacherid": "2020098",
        "releasedate": "2020-01-19T00:00:00.000+0000",
        "url": "http://www.liupengstudy.cn/pp/123/11uy12198isd.docx",
        "isselect": 0
      },
      {
        "id": 2,
        "papername": "《高校毕业设计选题系统》",
        "teacherid": "2020098",
        "releasedate": "2020-01-19T00:00:00.000+0000",
        "url": "http://www.liupengstudy.cn/pp/123/11uy12198isd.docx",
        "isselect": 0
      },
      {
        "id": 3,
        "papername": "《高校毕业设计选题系统》",
        "teacherid": "2020098",
        "releasedate": "2020-01-19T00:00:00.000+0000",
        "url": "http://www.liupengstudy.cn/pp/123/11uy12198isd.docx",
        "isselect": 0
      },
      {
        "id": 4,
        "papername": "《高校毕业设计选题系统》",
        "teacherid": "2020098",
        "releasedate": "2020-01-19T00:00:00.000+0000",
        "url": "http://www.liupengstudy.cn/pp/123/11uy12198isd.docx",
        "isselect": 0
      },
      {
        "id": 6,
        "papername": "《高校毕业设计选题系统》",
        "teacherid": "2020098",
        "releasedate": "2020-01-19T00:00:00.000+0000",
        "url": "http://www.liupengstudy.cn/pp/123/11uy12198isd.docx",
        "isselect": 0
      }
    ];

    var tempList = listData.map((value){
      /*return ListTile(
        leading: Icon(Icons.list),
        title: Text(value["papername"]),
        subtitle: Text(value["releasedate"]),
      );*/
      return TopicCrad(
        id: value['id'].toString(),
        papername: value['papername'],
        teacherid: value['teacherid'],
        releasedate: value['releasedate'].toString(),
        isselect: value['isselect'].toString(),
        url: value['url'],
      );
    });
    return tempList.toList();
  }

  List<Widget> list = new List();


  MyApp() {
    _getList();
  }
  // 自定义方法实现动态方法
  List<Widget> _getList() {
    for (var i = 0;i<10;i++) {
      this.list.add(
        ListTile(
          leading: Image.network("https://i.loli.net/2020/01/22/8Xa1hoLzgjrDkJU.png"),
          title: Text('123'),
          subtitle: Text("build(BuildContext context) {"),
          trailing: Image.network("https://i.loli.net/2020/01/22/8Xa1hoLzgjrDkJU.png"),
        ),
      );
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "flutter Demo",
          ),
        ),
        body: Center(
          child: Container(
              child: ListView(
                padding: EdgeInsets.all(10),
                children: _getList1(),
              ),
              /*child: ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return this.list[index];
                  }
              ),*/
          ),
        ),
      ),
    );
  }
}
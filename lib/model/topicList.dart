
import 'package:application_paper/model/topicCard.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: TopicList(),));

class TopicList extends StatefulWidget {
  @override
  _TopicListState createState() => _TopicListState();
}

class _TopicListState extends State<TopicList> {

  List listData;

  Widget page;

  void postHttp() async {
    try{
      var response = await Dio().post(
        'http://123.56.167.84:8080/selection_of_college_graduation_design-0.0.1-SNAPSHOT/paper/selectAll',
      );
      print(response.data['whatYourDo']);
      listData = response.data['returnObject'];
      print(listData);
    }catch(e){
      return null;
    }
  }

  List<Widget> _getList1() {
    var tempList = listData.map((value){
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

  @override
  Widget build(BuildContext context) {
    postHttp();
    return page;
  }

  Widget noData() {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            child: Text('暂无数据'),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.autorenew),
          onPressed: () {
            if (listData == null) {
              print('null');
            } else {
              setState(() {
                page = hasData();
              });
              print('has Data');
            }
          },
        ),
      ),
    );
  }

  Widget hasData() {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            child: ListView(
              padding: EdgeInsets.all(10),
              children: _getList1(),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    page = noData();
  }


}


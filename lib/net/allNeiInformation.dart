




import 'dart:convert' show json;
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() => runApp(PalyNet());


class PalyNet extends StatefulWidget {
  @override
  _PalyState createState() => _PalyState();
}

class _PalyState extends State<PalyNet> {
  @override
  Widget build(BuildContext context) {
    getHttp();
    return MaterialApp(
      home: TabsPage(),
    );
  }

  getHttp() async {
    try{
      var response = await Dio().post(
          'http://123.56.167.84:8080/selection_of_college_graduation_design-0.0.1-SNAPSHOT/paper/selectAll',
      );
      print(response.data['whatYourDo']);
      print(response.data['returnObject']);

    }catch(e){
      return null;
    }
  }
}

class TabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        //child: Text("${getHttp()}"),
        child: Text('http://123.56.167.84:8080/selection_of_colhttp://123.56.167'
            '.84:8080/selection_of_college_graduation_design-0.0.1-SNAPSHOT/pape'
            'r/selectAlllege_graduatihttp://123.56.167.84:8080/selection_of_colle'
            'ge_graduation_design-0.0.1-SNAPSHOT/paper/selectAllhttp://123.56.16'
            '7.84:8080/selection_of_college_graduation_design-0.0.1-SNAPSHOT/pa'
            'per/selectAllon_design-0.0.1-SNAPSHOT/paper/selectAll'),
      ),
    );
  }


}
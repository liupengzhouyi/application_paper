

import 'package:application_paper/pojo/student/StudentApplicationPaperBean.dart';
import 'package:dio/dio.dart';

class StudentApplicationPaperByPaperID {

  StudentApplicationPaperBean studentApplicationPaperBean;

  StudentApplicationPaperByPaperID({this.studentApplicationPaperBean});

  void postHttp() async {
    try{
      var response = await Dio().post(
        'http://123.56.167.84:8080/selection_of_college_graduation_design-0.0.1-SNAPSHOT/applicationPaper/add',
        data: this.studentApplicationPaperBean.toJson(),
      );
      print(response.data['whatYourDo']);
      listData = response.data['returnObject'];
      print(listData);
    }catch(e){
      return null;
    }
  }


}

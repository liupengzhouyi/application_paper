

import 'package:application_paper/pojo/student/ReturnStudentApplicationPaperBean.dart';
import 'package:application_paper/pojo/student/StudentApplicationPaperBean.dart';
import 'package:dio/dio.dart';

class StudentApplicationPaperByPaperID {

  StudentApplicationPaperBean studentApplicationPaperBean;

  StudentApplicationPaperByPaperID({this.studentApplicationPaperBean}) {
    this.postHttp();
  }

  ReturnStudentApplicationPaperBean returnStudentApplicationPaperBean;

  void postHttp() async {
    try{
      var response = await Dio().post(
        'http://123.56.167.84:8080/selection_of_college_graduation_design-0.0.1-SNAPSHOT/applicationPaper/add',
        data: this.studentApplicationPaperBean.toJson(),
      );
      this.returnStudentApplicationPaperBean = ReturnStudentApplicationPaperBean.fromJson(response.data);
      print(this.returnStudentApplicationPaperBean);
    }catch(e){
      return null;
    }
  }


}

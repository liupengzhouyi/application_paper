
import 'package:application_paper/pojo/landing/StudentLanding/ReturnStudentLandingBean.dart';
import 'package:application_paper/pojo/landing/StudentLanding/StudentLandingBean.dart';
import 'package:dio/dio.dart';

class StudentCheckLanding {

  StudentLandingBean studentLandingBean;

  ReturnStudentLandingBean returnStudentLandingBean;

  StudentCheckLanding({this.studentLandingBean}) {
    this.postHttp();
  }

  void postHttp() async {
    try{
      var response = await Dio().post(
        'http://123.56.167.84:8080/selection_of_college_graduation_design-0.0.1-SNAPSHOT/studentsLanding/landing',
        data: this.studentLandingBean.toJson(),
      );
      returnStudentLandingBean = ReturnStudentLandingBean.fromJson(response.data);
      print(response);
      print(returnStudentLandingBean);
    }catch(e){
      returnStudentLandingBean = null;
    }
  }

}


import 'package:application_paper/pojo/landing/StudentLanding/ReturnStudentLandingBean.dart';
import 'package:application_paper/pojo/landing/StudentLanding/StudentLandingBean.dart';
import 'package:application_paper/pojo/landing/TeacherLanding/ReturnTeacherLandingBean.dart';
import 'package:application_paper/pojo/landing/TeacherLanding/TeacherLandingBean.dart';
import 'package:dio/dio.dart';

class TeacherCheckLanding {

  TeacherLandingBean teacherLandingBean;

  ReturnTeacherLandingBean returnTeacherLandingBean;

  TeacherCheckLanding({this.teacherLandingBean}) {
    this.postHttp();
  }

  void postHttp() async {
    try{
      var response = await Dio().post(
        'http://123.56.167.84:8080/selection_of_college_graduation_design-0.0.1-SNAPSHOT/teachersLanding/landing',
        data: this.teacherLandingBean.toJson(),
      );
      returnTeacherLandingBean = ReturnTeacherLandingBean .fromJson(response.data);
      print(response);
      print(returnTeacherLandingBean);
    }catch(e){
      returnTeacherLandingBean = null;
    }
  }

}

import 'package:application_paper/pojo/landing/ManagerLanding/ManagerLandingBean.dart';
import 'package:application_paper/pojo/landing/ManagerLanding/ReturnManagerLandingBean.dart';
import 'package:application_paper/pojo/landing/StudentLanding/ReturnStudentLandingBean.dart';
import 'package:application_paper/pojo/landing/StudentLanding/StudentLandingBean.dart';
import 'package:dio/dio.dart';

class ManagerCheckLanding {

  ManagersLandingBean managersLandingBean;

  ReturnManagerLandingBean returnManagerLandingBean;

  ManagerCheckLanding({this.managersLandingBean}) {
    this.postHttp();
  }

  void postHttp() async {
    try{
      var response = await Dio().post(
        'http://123.56.167.84:8080/selection_of_college_graduation_design-0.0.1-SNAPSHOT/managersLanding/landing',
        data: this.managersLandingBean.toJson(),
      );
      returnManagerLandingBean = ReturnManagerLandingBean.fromJson(response.data);
      print(response);
      print(returnManagerLandingBean);
    }catch(e){
      returnManagerLandingBean = null;
    }
  }

}
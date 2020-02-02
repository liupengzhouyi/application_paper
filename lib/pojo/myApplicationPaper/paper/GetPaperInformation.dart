
import 'package:application_paper/pojo/myApplicationPaper/paper/GetPaperInformationBean.dart';
import 'package:application_paper/pojo/myApplicationPaper/paper/PaperIDBean.dart';
import 'package:dio/dio.dart';

void main() {
  GetPaperInformation getPaperInformation = new GetPaperInformation(paperIDBean: new PaperIDBean(integer: "1"));
  print(getPaperInformation.getPaperInformationBean.toString());
  return null;
}

// 通过论文ID获取论文信息
class GetPaperInformation {

  PaperIDBean paperIDBean;

  GetPaperInformationBean getPaperInformationBean;

  GetPaperInformation({this.paperIDBean}) {
    this.postHttp();
  }

  void postHttp() async {
    try{
      var response = await Dio().post(
        'http://123.56.167.84:8080/selection_of_college_graduation_design-0.0.1-SNAPSHOT/paper/selectByID',
        data: this.paperIDBean.toJson(),
      );
      getPaperInformationBean = GetPaperInformationBean.fromJson(response.data);
      print(response);
    }catch(e){
      getPaperInformationBean = null;
    }
  }

}


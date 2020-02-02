
// 论文包体信息（内部包含一个或者没哦呦论文信息）
import 'package:application_paper/pojo/myApplicationPaper/paper/ReturnObject.dart';

class GetPaperInformationBean {
  String whatYourDo;
  int number;
  bool key;
  ReturnObject returnObject;
  String why;

  GetPaperInformationBean(
      {this.whatYourDo, this.number, this.key, this.returnObject, this.why});

  GetPaperInformationBean.fromJson(Map<String, dynamic> json) {
    whatYourDo = json['whatYourDo'];
    number = json['number'];
    key = json['key'];
    returnObject = json['returnObject'] != null
        ? new ReturnObject.fromJson(json['returnObject'])
        : null;
    why = json['why'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['whatYourDo'] = this.whatYourDo;
    data['number'] = this.number;
    data['key'] = this.key;
    if (this.returnObject != null) {
      data['returnObject'] = this.returnObject.toJson();
    }
    data['why'] = this.why;
    return data;
  }
}

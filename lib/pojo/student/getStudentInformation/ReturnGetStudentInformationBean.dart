import 'package:application_paper/pojo/student/getStudentInformation/ReturnObject.dart';

class ReturnGetStudentInformationBean {
  String whatYourDo;
  int number;
  bool key;
  List<ReturnObject> returnObject;
  String why;

  ReturnGetStudentInformationBean(
      {this.whatYourDo, this.number, this.key, this.returnObject, this.why});

  ReturnGetStudentInformationBean.fromJson(Map<String, dynamic> json) {
    whatYourDo = json['whatYourDo'];
    number = json['number'];
    key = json['key'];
    if (json['returnObject'] != null) {
      returnObject = new List<ReturnObject>();
      json['returnObject'].forEach((v) {
        returnObject.add(new ReturnObject.fromJson(v));
      });
    }
    why = json['why'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['whatYourDo'] = this.whatYourDo;
    data['number'] = this.number;
    data['key'] = this.key;
    if (this.returnObject != null) {
      data['returnObject'] = this.returnObject.map((v) => v.toJson()).toList();
    }
    data['why'] = this.why;
    return data;
  }
}


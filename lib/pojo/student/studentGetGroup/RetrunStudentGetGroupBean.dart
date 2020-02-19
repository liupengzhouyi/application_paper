import 'package:application_paper/pojo/student/studentGetGroup/ReturnObject.dart';

class RetrunStudentGetGroupBean {
  String whatYourDo;
  int number;
  bool key;
  List<ReturnObject> returnObject;
  String why;

  RetrunStudentGetGroupBean(
      {this.whatYourDo, this.number, this.key, this.returnObject, this.why});

  RetrunStudentGetGroupBean.fromJson(Map<String, dynamic> json) {
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

  @override
  String toString() {
    return 'RetrunStudentGetGroupBean{whatYourDo: $whatYourDo, number: $number, key: $key, returnObject: $returnObject, why: $why}';
  }


}
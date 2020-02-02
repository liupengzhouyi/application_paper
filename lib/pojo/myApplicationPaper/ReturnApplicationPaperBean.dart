
// 论文申请信息全部信息
class ReturnApplicationPaperBean {
  String whatYourDo;
  int number;
  bool key;
  List<ReturnObject> returnObject;
  String why;

  ReturnApplicationPaperBean(
      {this.whatYourDo, this.number, this.key, this.returnObject, this.why});

  ReturnApplicationPaperBean.fromJson(Map<String, dynamic> json) {
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
    return 'ReturnApplicationPaperBean{whatYourDo: $whatYourDo, number: $number, key: $key, returnObject: $returnObject, why: $why}';
  }


}

// 论文申请信息

class ReturnObject {
  int id;
  int paperid;
  String studentid;
  int ispass;

  ReturnObject({this.id, this.paperid, this.studentid, this.ispass});

  ReturnObject.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    paperid = json['paperid'];
    studentid = json['studentid'];
    ispass = json['ispass'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['paperid'] = this.paperid;
    data['studentid'] = this.studentid;
    data['ispass'] = this.ispass;
    return data;
  }

  @override
  String toString() {
    return 'ReturnObject{id: $id, paperid: $paperid, studentid: $studentid, ispass: $ispass}';
  }


}
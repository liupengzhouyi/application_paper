class ReturnTeacherApplicationPaperBean {
  String whatYourDo;
  String number;
  bool key;
  List<ReturnObject> returnObject;
  Null why;

  ReturnTeacherApplicationPaperBean(
      {this.whatYourDo, this.number, this.key, this.returnObject, this.why});

  ReturnTeacherApplicationPaperBean.fromJson(Map<String, dynamic> json) {
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
    return 'ReturnTeacherApplicationPaperBean{whatYourDo: $whatYourDo, number: $number, key: $key, returnObject: $returnObject, why: $why}';
  }


}

class ReturnObject {
  String isPass;
  String paperID;
  String paperName;
  String studentNumber;
  String studentName;

  ReturnObject(
      {this.isPass,
        this.paperID,
        this.paperName,
        this.studentNumber,
        this.studentName});

  ReturnObject.fromJson(Map<String, dynamic> json) {
    isPass = json['isPass'];
    paperID = json['paperID'];
    paperName = json['paperName'];
    studentNumber = json['studentNumber'];
    studentName = json['studentName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isPass'] = this.isPass;
    data['paperID'] = this.paperID;
    data['paperName'] = this.paperName;
    data['studentNumber'] = this.studentNumber;
    data['studentName'] = this.studentName;
    return data;
  }

  @override
  String toString() {
    return 'ReturnObject{isPass: $isPass, paperID: $paperID, paperName: $paperName, studentNumber: $studentNumber, studentName: $studentName}';
  }


}
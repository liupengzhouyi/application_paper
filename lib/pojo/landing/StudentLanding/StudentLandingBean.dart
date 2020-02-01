class StudentLandingBean {
  int id;
  int passwordvalue;
  String studentsid;

  StudentLandingBean({this.id, this.passwordvalue, this.studentsid});

  StudentLandingBean.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    passwordvalue = json['passwordvalue'];
    studentsid = json['studentsid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['passwordvalue'] = this.passwordvalue;
    data['studentsid'] = this.studentsid;
    return data;
  }

  @override
  String toString() {
    return 'StudentLandingBean{id: $id, passwordvalue: $passwordvalue, studentsid: $studentsid}';
  }


}
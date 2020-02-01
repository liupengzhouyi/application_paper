class ManagerLandingBean {
  int id;
  int passwordvalue;
  String studentsid;

  ManagerLandingBean({this.id, this.passwordvalue, this.studentsid});

  ManagerLandingBean.fromJson(Map<String, dynamic> json) {
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
    return 'ManagerLandingBean{id: $id, passwordvalue: $passwordvalue, studentsid: $studentsid}';
  }


}

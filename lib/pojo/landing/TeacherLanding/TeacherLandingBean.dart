class TeacherLandingBean {
  int id;
  String passwordvalue;
  String teacherid;

  TeacherLandingBean({this.id, this.passwordvalue, this.teacherid});

  TeacherLandingBean.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    passwordvalue = json['passwordvalue'];
    teacherid = json['teacherid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['passwordvalue'] = this.passwordvalue;
    data['teacherid'] = this.teacherid;
    return data;
  }

  @override
  String toString() {
    return 'TeacherLandingBean{id: $id, passwordvalue: $passwordvalue, teacherid: $teacherid}';
  }


}
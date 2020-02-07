class StudentApplicationPaperBean {
  int id;
  String ispass;
  String paperid;
  String studentid;

  StudentApplicationPaperBean(
      {this.id, this.ispass, this.paperid, this.studentid});

  StudentApplicationPaperBean.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ispass = json['ispass'];
    paperid = json['paperid'];
    studentid = json['studentid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ispass'] = this.ispass;
    data['paperid'] = this.paperid;
    data['studentid'] = this.studentid;
    return data;
  }

  @override
  String toString() {
    return 'StudentApplicationPaperBean{id: $id, ispass: $ispass, paperid: $paperid, studentid: $studentid}';
  }


}
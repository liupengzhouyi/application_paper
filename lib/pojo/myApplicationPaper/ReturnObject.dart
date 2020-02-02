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
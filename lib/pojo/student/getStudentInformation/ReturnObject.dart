class ReturnObject {
  int id;
  String studentid;
  String phonenumber;
  String name;

  ReturnObject({this.id, this.studentid, this.phonenumber, this.name});

  ReturnObject.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    studentid = json['studentid'];
    phonenumber = json['phonenumber'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['studentid'] = this.studentid;
    data['phonenumber'] = this.phonenumber;
    data['name'] = this.name;
    return data;
  }

  @override
  String toString() {
    return 'ReturnObject{id: $id, studentid: $studentid, phonenumber: $phonenumber, name: $name}';
  }


}
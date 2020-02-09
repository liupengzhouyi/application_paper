class ReturnObject {
  int id;
  String teacherid;
  String phonenumber;
  String name;

  ReturnObject({this.id, this.teacherid, this.phonenumber, this.name});

  ReturnObject.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    teacherid = json['teacherid'];
    phonenumber = json['phonenumber'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['teacherid'] = this.teacherid;
    data['phonenumber'] = this.phonenumber;
    data['name'] = this.name;
    return data;
  }
}
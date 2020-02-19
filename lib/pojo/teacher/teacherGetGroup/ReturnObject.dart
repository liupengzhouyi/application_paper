class ReturnObject {
  int id;
  String groupname;
  String teacherid;

  ReturnObject({this.id, this.groupname, this.teacherid});

  ReturnObject.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    groupname = json['groupname'];
    teacherid = json['teacherid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['groupname'] = this.groupname;
    data['teacherid'] = this.teacherid;
    return data;
  }
}
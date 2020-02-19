class ReturnObject {
  int groupID;
  String name;
  String groupName;
  String teacherID;

  ReturnObject({this.groupID, this.name, this.groupName, this.teacherID});

  ReturnObject.fromJson(Map<String, dynamic> json) {
    groupID = json['groupID'];
    name = json['name'];
    groupName = json['groupName'];
    teacherID = json['teacherID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['groupID'] = this.groupID;
    data['name'] = this.name;
    data['groupName'] = this.groupName;
    data['teacherID'] = this.teacherID;
    return data;
  }

  @override
  String toString() {
    return 'ReturnObject{groupID: $groupID, name: $name, groupName: $groupName, teacherID: $teacherID}';
  }
}
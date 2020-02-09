class ReturnObject {
  int id;
  int isPass;
  int paperID;
  String paperName;
  String teacherID;
  String teachername;

  ReturnObject(
      {this.id,
        this.isPass,
        this.paperID,
        this.paperName,
        this.teacherID,
        this.teachername});

  ReturnObject.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isPass = json['isPass'];
    paperID = json['paperID'];
    paperName = json['paperName'];
    teacherID = json['teacherID'];
    teachername = json['teachername'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['isPass'] = this.isPass;
    data['paperID'] = this.paperID;
    data['paperName'] = this.paperName;
    data['teacherID'] = this.teacherID;
    data['teachername'] = this.teachername;
    return data;
  }

  @override
  String toString() {
    return 'ReturnObject{id: $id, isPass: $isPass, paperID: $paperID, paperName: $paperName, teacherID: $teacherID, teachername: $teachername}';
  }


}
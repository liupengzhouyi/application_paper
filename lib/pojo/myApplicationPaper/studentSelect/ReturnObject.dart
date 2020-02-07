class ReturnObject {
  int isPass;
  int paperID;
  String paperName;
  String teacherID;
  String teachername;

  ReturnObject(
      {this.isPass,
        this.paperID,
        this.paperName,
        this.teacherID,
        this.teachername});

  ReturnObject.fromJson(Map<String, dynamic> json) {
    isPass = json['isPass'];
    paperID = json['paperID'];
    paperName = json['paperName'];
    teacherID = json['teacherID'];
    teachername = json['teachername'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isPass'] = this.isPass;
    data['paperID'] = this.paperID;
    data['paperName'] = this.paperName;
    data['teacherID'] = this.teacherID;
    data['teachername'] = this.teachername;
    return data;
  }
}
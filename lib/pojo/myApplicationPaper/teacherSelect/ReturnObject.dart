class ReturnObject {
  int id;
  int isPass;
  int paperID;
  String paperName;
  String studentNumber;
  String studentName;

  ReturnObject(
      {this.id,
        this.isPass,
        this.paperID,
        this.paperName,
        this.studentNumber,
        this.studentName});

  ReturnObject.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isPass = json['isPass'];
    paperID = json['paperID'];
    paperName = json['paperName'];
    studentNumber = json['studentNumber'];
    studentName = json['studentName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['isPass'] = this.isPass;
    data['paperID'] = this.paperID;
    data['paperName'] = this.paperName;
    data['studentNumber'] = this.studentNumber;
    data['studentName'] = this.studentName;
    return data;
  }

  @override
  String toString() {
    return 'ReturnObject{id: $id, isPass: $isPass, paperID: $paperID, paperName: $paperName, studentNumber: $studentNumber, studentName: $studentName}';
  }


}